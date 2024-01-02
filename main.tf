data "template_file" "general-ecs-template" {
    template = file("templates/${var.ecs_template_file}")
        
    vars = {
        docker_image_url        = "${var.ecr_url}/${var.repository}:${var.repository_version}"
        account_id              = var.iam_access_account_id
        region                  = var.region
        docker_image_name       = var.repository
        image_tag               = var.repository_version
        log_group_name          = var.s3_cloudwatch_codebuild_id
        env_arn                 = "arn:aws:s3:::${var.s3_private_id}/${var.s3_object_config_key}"
        aws_access_key_id       = var.iam_access_key_id
        aws_secret_access_key   = var.iam_access_key_secret
        aws_storage_bucket_name = "${var.env_name}"
        port = var.container_port
        env_version = var.env_name
    }
}

resource "aws_ecs_task_definition" "general-task-def" {
  family                   = "${var.env_name}-${var.repository_name}"
  network_mode             = "awsvpc" // FARGATE only supports this networking mode
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = var.execution_role_arn
  # task_role_arn            = aws_iam_role.service-ims-task-role.arn
  cpu                      = var.task_def_cpu
  memory                   = var.task_def_memory
  container_definitions    = data.template_file.general-ecs-template.rendered

  lifecycle {
    ignore_changes = [
      # container_definitions
    ]
  }
}

resource "aws_ecs_service" "general-ecs-service" {
  name                   = "${var.env_name}-${var.repository_name}"
  cluster                = var.ecs_cluster_id
  task_definition        = aws_ecs_task_definition.general-task-def.arn
  launch_type            = "FARGATE"
  desired_count          = var.app_count
  depends_on             = [var.ecs_alb_http_listener]
  # enable_execute_command = true
  // deployment_controller khi co cicd
  deployment_controller {
    type = "CODE_DEPLOY"
  }
  lifecycle {
    ignore_changes = [
      load_balancer,
      task_definition
    ]
  }
  load_balancer {
    target_group_arn = var.ecs_alb_target_group_blue_arn
    container_name   = "${var.env_name}-${var.repository_name}"
    container_port   = var.container_port
  }
  network_configuration {
    assign_public_ip = true
    subnets          = [var.public_subnet_1_id, var.public_subnet_2_id]
    security_groups  = [var.security_group_id]
  }
  tags = {
    Name = "${var.env_name}-${var.repository_name}"
  }
}
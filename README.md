# module_aws_vpc  
My module vpc aws

## Getting started  
config git credentical for private repo   
href: https://gitlab.com/exnodes-new/terraform-core/-/tree/master/modules/module_aws_ecs?ref_type=heads

add module    
example:       
```JavaScript

module "example_ecs" {
  source = "./modules/module_aws_ecs"
  env_name = "your environment name, Ex: `prod`"
  repository_name = "your repository name, Ex: `service-api`"
  repository = "your repository, Ex: `service.api`"
  repository_version = "your repository version, Ex: `latest, staging, develop`"
  s3_object_config_key = "your s3 object config key"
  ecs_cluster_id = "you cluster id"
  // vpc
  security_group_id = "your security group id"
  public_subnet_2_id = "your public subnet 2 id"
  public_subnet_1_id = "your public subnet 1 id"
  ecs_alb_target_group_blue_arn = "your target group blue arn"
  execution_role_arn = "your execution role arn"
  ecs_alb_http_listener = "your alb http listener"
  // end VPC
  iam_access_account_id = "your access account id"
  s3_cloudwatch_codebuild_id = "your cloudwatch codebuild id"
  s3_private_id = "your s3 bucket private id"
  iam_access_key_secret = "your access key secret"
  iam_access_key_id = "your access key id"
  region = "your region, Ex: `us-east-2`"
  ecs_template_file = "your path ecs template file, Ex: `example.api.json.tpl`"
  ecr_url = "your ecr url, Ex: `***.dkr.ecr.us-east-2.amazonaws.com`"
  task_def_cpu = "your task def cpu: Ex: `1024`"
  task_def_memory = "your task def memory: Ex: `2048`"
}
```

# Input 
```JavaScript
variable "env_name" {
  description = "Define environment name"
  type = string
}
variable "repository_name" {
    description = "Repository name"
    type        = string
}
variable "repository" {
    description = "Git repository"
    type        = string
}
variable "repository_version" {
    description = "Git repository version"
    type        = string
}
variable "iam_access_account_id" {
  description = "Get IAM access key id from current account"
  type = string
}
variable "ecr_url" {
  description = "ECR url to run in the ECS cluster"
  type        = string
}
variable "region" {
  description = "Region"
  type = string
}
variable "ecs_template_file" {
  description = "Command ECS run source"
  type = string
}
# S3
variable "s3_cloudwatch_codebuild_id" {
    description = "S3 cloudwatch codebuild id"
    type = string
}
variable "s3_private_id" {
    description = "s3 private id"
    type = string
}
variable "s3_object_config_key" {
    description = "s3 object config key"
    type = string
}
variable "iam_access_key_id" {
    description = "aws_iam_access_key id"
    type = string
}
variable "iam_access_key_secret" {
    description = "aws_iam_access_key secret"
    type = string
}
variable "container_port" {
  description = "Container port"
  type        = number
  default     = 80
}
variable "task_def_cpu" {
    description = "Task defination CPU"
    type = number
}
variable "task_def_memory" {
    description = "Task defination memory"
    type = number
}
variable "execution_role_arn" {
    description = "Execution role arn from module VPC"
    type        = string
}
variable "app_count" {
  description = "Number of Docker containers to run"
  type        = number
  default     = 1
}
variable "ecs_cluster_id" {
  description = "ID of the ECS cluster"
  type        = string
}
# Listener (redirects traffic from the load balancer to the target group)
variable "ecs_alb_http_listener" {
  description = "Listener (redirects traffic from the load balancer to the target group)"
  type        = any
}
variable "ecs_alb_target_group_blue_arn" {
  description = "Target group arn"
  type = string
}
variable "public_subnet_1_id" {
  description = "Public subnet 1 ID from module VPC"
  type        = string
}
variable "public_subnet_2_id" {
  description = "Public subnet 2 ID from module VPC"
  type        = string
}
variable "security_group_id" {
  description = "Security group ID from module VPC"
  type        = string
}
```

# Output 
```JavaScript
output "ecs_task_def" {
    description = "Get ecs task definition arn"
    value = aws_ecs_task_definition.general-task-def
}
output "ecs_service" {
    description = "Get ecs service"
    value = aws_ecs_service.general-ecs-service
}
output "ecs_service_name" {
    description = "Get ecs service name"
    value = aws_ecs_service.general-ecs-service.name
}
output "ecs_task_def_family" {
  description = "Get ecs task def family"
  value = aws_ecs_task_definition.general-task-def.family
}
```
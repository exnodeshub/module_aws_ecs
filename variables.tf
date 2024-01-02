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
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
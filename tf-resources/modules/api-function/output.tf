output "function_arn" {
  value       = module.function.function_arn
  description = "The arn of the lambda function."
}

output "function_name" {
  value       = module.function.function_name
  description = "The name of the lambda function."
}

output "function_role_arn" {
  value = module.function.function_role_arn
}

output "function_role_name" {
  value = module.function.function_role_name
}

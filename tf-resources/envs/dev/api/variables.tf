variable "deploy_lambda_bucket_name" {
  description = "The bucket name where we host deployed lambdas"
  type        = string
}


variable "stage" {
  description = "Env. stage name"
  type        = string
}

variable "region" {
  type        = string
  description = "AWS region where the resources will be deployed"
}

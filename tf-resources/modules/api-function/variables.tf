variable "lambda_bucket_id" {
  description = "The id of the bucket lambda function code will be stored"
  type        = string
}

variable "api_id" {
  description = "The id of the API Gateway"
  type        = string
}

variable "function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "environment_variables" {
  description = "Environment variables to pass to the Lambda function"
  type        = map(string)
  default     = {}
}

variable "route" {
  description = "The API route"
  type        = string
}

variable "http_method" {
  description = "Http method verb"
  type        = string
  default     = "POST"
  validation {
    condition     = contains(["POST", "GET", "PUT", "PATCH", "DELETE"], var.http_method)
    error_message = "Valid value is one of the following: POST, GET, PUT, PATCH, DELETE."
  }
}

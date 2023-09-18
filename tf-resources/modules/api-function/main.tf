data "aws_apigatewayv2_api" "this" {
  api_id = var.api_id
}

module "function" {
  source                = "../lambda-function"
  lambda_bucket_id      = var.lambda_bucket_id
  publish_dir           = "../../../../src/Lambdas/${var.function_name}/bin/Release/net6.0/linux-x64/publish/"
  zip_file              = "${var.function_name}.zip"
  function_name         = var.function_name
  lambda_handler        = "${var.function_name}::${var.function_name}.Function::FunctionHandler"
  environment_variables = var.environment_variables
}

module "api_function" {
  source        = "../api-gateway-lambda-integration"
  api_id        = data.aws_apigatewayv2_api.this.api_id
  api_arn       = data.aws_apigatewayv2_api.this.arn
  function_arn  = module.function.function_arn
  function_name = module.function.function_name
  http_method   = var.http_method
  route         = var.route
}

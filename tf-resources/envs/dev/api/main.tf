resource "aws_s3_bucket" "deployment_bucket" {
  bucket = var.deploy_lambda_bucket_name

  force_destroy = true
}

module "api_gateway" {
  source            = "../../../modules/api-gateway"
  api_name          = "catalog"
  stage_name        = var.stage
  stage_auto_deploy = true
}

module "products_api" {
  source = "../../../features/products/api"

  lambda_bucket_id = aws_s3_bucket.deployment_bucket.id
  api_id           = module.api_gateway.api_id
}

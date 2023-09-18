module "create-function" {
  source = "../../../modules/api-function"

  lambda_bucket_id = var.lambda_bucket_id
  api_id           = var.api_id

  function_name = "ProductCreate"
  route         = "/products"
  http_method   = "POST"
}


module "get-function" {
  source = "../../../modules/api-function"

  lambda_bucket_id = var.lambda_bucket_id
  api_id           = var.api_id

  function_name = "ProductGet"
  route         = "/products/{id}"
  http_method   = "GET"
}

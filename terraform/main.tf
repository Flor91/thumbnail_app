# Lambda module
module "lambda" {
  source = "./lambda"

  lambda_function_name = var.lambda_function_name
  lambda_handler       = var.lambda_handler
  lambda_runtime       = var.lambda_runtime
}

# API Gateway module
module "api_gateway" {
  source = "./api_gateway"

  api_name   = var.api_name
  stage_name = var.stage_name
  lambda_arn = module.lambda.lambda_function_arn
}

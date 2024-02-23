# Lambda module outputs
output "lambda_function_arn" {
  description = "ARN of the created Lambda function"
  value       = module.lambda.lambda_function_arn
}

# API Gateway module outputs
output "api_gateway_url" {
  description = "URL of the deployed API Gateway"
  value       = module.api_gateway.api_gateway_url
}

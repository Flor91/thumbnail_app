output "api_gateway_url" {
  description = "URL of the deployed API Gateway"
  value       = aws_api_gateway_deployment.thumbnail_deployment.invoke_url
}

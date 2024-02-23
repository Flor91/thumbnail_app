variable "api_name" {
  description = "Name of the API Gateway REST API"
  type        = string
}

variable "stage_name" {
  description = "Name of the deployment stage for the API Gateway"
  type        = string
}

variable "lambda_arn" {
  description = "ARN of the Lambda function to integrate with API Gateway"
  type        = string
}

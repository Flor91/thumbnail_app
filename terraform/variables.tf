# Lambda module variables
variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "lambda_handler" {
  description = "Handler function for the Lambda function"
  type        = string
  default     = "lambda_function.lambda_handler"
}

variable "lambda_runtime" {
  description = "Runtime for the Lambda function"
  type        = string
  default     = "python3.9"
}

# API Gateway module variables
variable "api_name" {
  description = "Name of the API Gateway REST API"
  type        = string
}

variable "stage_name" {
  description = "Name of the deployment stage for the API Gateway"
  type        = string
}

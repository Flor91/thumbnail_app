resource "aws_api_gateway_rest_api" "thumbnail_api" {
  name        = var.api_name
  description = "API for thumbnail generation"
}

resource "aws_api_gateway_resource" "thumbnail_resource" {
  rest_api_id = aws_api_gateway_rest_api.thumbnail_api.id
  parent_id   = aws_api_gateway_rest_api.thumbnail_api.root_resource_id
  path_part   = "thumbnails"
}

resource "aws_api_gateway_method" "thumbnail_method" {
  rest_api_id   = aws_api_gateway_rest_api.thumbnail_api.id
  resource_id   = aws_api_gateway_resource.thumbnail_resource.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "thumbnail_integration" {
  rest_api_id             = aws_api_gateway_rest_api.thumbnail_api.id
  resource_id             = aws_api_gateway_resource.thumbnail_resource.id
  http_method             = aws_api_gateway_method.thumbnail_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_arn
}

resource "aws_api_gateway_deployment" "thumbnail_deployment" {
  depends_on  = [aws_api_gateway_integration.thumbnail_integration, aws_cloudwatch_log_group.thumbnail_log_group]
  rest_api_id = aws_api_gateway_rest_api.thumbnail_api.id
  stage_name  = var.stage_name
}

resource "aws_api_gateway_integration_response" "thumbnail_integration_response" {
  rest_api_id = aws_api_gateway_rest_api.thumbnail_api.id
  resource_id = aws_api_gateway_resource.thumbnail_resource.id
  http_method = aws_api_gateway_method.thumbnail_method.http_method
  status_code = "200"

  response_templates = {
    "application/json" = <<EOF
{
  "statusCode": $input.json('$.statusCode'),
  "headers": $input.json('$.headers'),
  "body": $input.json('$.body')
}
EOF
  }

  depends_on = [aws_api_gateway_integration.thumbnail_integration]
}

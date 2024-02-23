resource "aws_cloudwatch_log_group" "thumbnail_log_group" {
  name              = "/aws/api-gateway/${aws_api_gateway_rest_api.thumbnail_api.id}/${var.stage_name}"
  retention_in_days = 1
}

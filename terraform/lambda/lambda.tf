resource "aws_lambda_function" "thumbnail_function" {
  filename      = "../target/lambda_function_payload.zip"
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_role.arn
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime
  timeout       = 60
  layers        = ["arn:aws:lambda:us-east-1:770693421928:layer:Klayers-p39-pillow:1"]
  publish       = true

  source_code_hash = filebase64sha256("../target/lambda_function_payload.zip")

  depends_on = [
    aws_iam_role_policy_attachment.lambda_logs,
    aws_cloudwatch_log_group.example,
  ]
}

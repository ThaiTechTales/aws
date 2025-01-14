resource "aws_lambda_function" "lambda_function" {
  function_name = var.function_name
  role          = var.lambda_role_arn
  handler       = var.handler
  runtime       = var.runtime
  s3_bucket     = var.s3_bucket
  s3_key        = var.s3_key
}
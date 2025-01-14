module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}

module "iam" {
  source             = "./modules/iam"
  lambda_role_name   = var.lambda_role_name
  lambda_policy_name = var.lambda_policy_name
  s3_bucket_arn      = module.s3.bucket_arn
}


module "lambda" {
  source          = "./modules/lambda"
  lambda_role_arn = module.iam.lambda_role_arn
  function_name   = var.function_name
  handler         = var.handler
  runtime         = var.runtime
  s3_bucket       = module.s3.bucket_name
  s3_key          = var.s3_key
}

resource "aws_s3_bucket_notification" "lambda_trigger" {
  bucket = module.s3.bucket_name

  lambda_function {
    lambda_function_arn = module.lambda.lambda_function_arn
    events              = ["s3:ObjectCreated:*"]
  }

  depends_on = [aws_lambda_permission.allow_s3]
}

resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "policy-dev-apse2-lambda-01"
  action        = "lambda:InvokeFunction"
  function_name = module.lambda.lambda_function_name
  principal     = "s3.amazonaws.com"

  source_arn = module.s3.bucket_arn
}

resource "aws_cloudwatch_log_group" "lambda_logs" {
  name              = "/aws/lambda/${module.lambda.lambda_function_name}"
  retention_in_days = var.retention_in_days
}
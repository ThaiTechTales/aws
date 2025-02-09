# ---------------------------------
# Provider: AWS
# ---------------------------------
aws_region = "ap-southeast-2"

# ---------------------------------
# S3 bucket: Lambda code storage
# ---------------------------------
bucket_name = "s3-dev-apse2-lambda-code-01"

# ---------------------------------
# Lambda function configuration
# ---------------------------------
lambda_role_name   = "role-dev-apse2-lambda-01"
lambda_policy_name = "policy-dev-apse2-lambda-01"
function_name      = "lambda-function-dev-apse2-s3-01"
handler            = "lambda_function.lambda_handler"
runtime            = "python3.9"
s3_key             = "lambda_code/lambda_function.zip"

# ---------------------------------
# CloudWatch Logs
# ---------------------------------
retention_in_days = 7
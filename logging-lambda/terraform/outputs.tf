output "bucket_name" {
  description = "S3 bucket name for Lambda code storage"
  value       = module.s3.bucket_name
}

output "lambda_function_name" {
  description = "Name of the deployed Lambda function"
  value       = module.lambda.lambda_function_name
}

output "lambda_role_arn" {
  description = "ARN of the IAM role assigned to Lambda"
  value       = module.iam.lambda_role_arn
}

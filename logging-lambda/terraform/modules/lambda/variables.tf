variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "lambda_role_arn" {
  description = "IAM role ARN for Lambda"
  type        = string
}

variable "handler" {
  description = "Lambda function handler (e.g., file.function_name)"
  type        = string
}

variable "runtime" {
  description = "Runtime environment for Lambda function (e.g., python3.9)"
  type        = string
}

variable "s3_bucket" {
  description = "S3 bucket storing Lambda function code"
  type        = string
}

variable "s3_key" {
  description = "S3 object key for Lambda function code"
  type        = string
}

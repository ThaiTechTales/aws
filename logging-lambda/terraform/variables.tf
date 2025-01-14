# ---------------------------------
# Provider: AWS
# ---------------------------------
variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

# ---------------------------------
# S3 bucket: Lambda code storage
# ---------------------------------
variable "bucket_name" {
  description = "Name of the S3 bucket for Lambda code storage"
  type        = string
}

# ---------------------------------
# Lambda: function configuration
# ---------------------------------

variable "lambda_role_name" {
  description = "Name of the IAM role for the Lambda function"
  type        = string
}

variable "lambda_policy_name" {
  description = "Name of the IAM policy for the Lambda function"
  type        = string
}

variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "handler" {
  description = "Lambda function handler (e.g., file.function_name)" # Entry point for the Lambda function
  type        = string
}

variable "runtime" {
  description = "Runtime environment for Lambda function (e.g., python3.9)"
  type        = string
}

variable "s3_key" {
  description = "S3 object key for the Lambda function code. Key refers to the path to the object in the S3 bucket"
  type        = string
}

variable "retention_in_days" {
  description = "Number of days to retain logs in CloudWatch Logs"
  type        = number
  default     = 7
}

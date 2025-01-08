variable "lambda_role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "lambda_policy_name" {
  description = "Name of the IAM policy"
  type        = string
  
}

variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  type        = string
}
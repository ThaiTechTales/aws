variable "role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "policy_name" {
  description = "Name of the IAM policy"
  type        = string
}

variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "handler" {
  description = "Lambda function handler"
  type        = string
}

variable "runtime" {
  description = "Runtime environment for Lambda"
  default     = "python3.9"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket to store processed data"
  type        = string
}

variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  type        = string
}

variable "email_topic_arn" {
  description = "ARN of the SNS topic for email notifications"
  type        = string
}

variable "sqs_queue_arn" {
  description = "ARN of the SQS queue for consuming messages"
  type        = string
}

variable "sqs_queue_url" {
  description = "URL of the SQS queue for sending messages"
  type        = string  
}

variable "retention_in_days" {
  description = "Number of days to retain logs in CloudWatch Logs"
  default     = 30
  type        = number
  
}
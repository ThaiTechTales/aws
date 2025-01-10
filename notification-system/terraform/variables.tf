# ----------------
# Provider: AWS
# ----------------
variable "aws_region" {
  default = "ap-southeast-2"
}

# -----------------------------------
# Simple Notification Service (SNS)
# -----------------------------------
variable sns_topic_name {
  description = "The name of the SNS topic"
  type        = string
}

variable "email_address" {
  description = "The email address to receive notifications"
  type        = string
  
}

# -----------------------------------
# Simple Queue Service (SQS)
# -----------------------------------
variable "queue_name" {
  description = "The name of the SQS queue"
  type        = string
}
variable "dlq_name" {
  description = "The name of the SQS dead-letter queue"
  type        = string
}

# ----------------
# S3 Bucket
# ----------------
variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

# ----------------
# Lambda Function
# ----------------

variable "role_name" {
  description = "The name of the IAM role"
  type        = string  
}

variable "policy_name" {
  description = "The name of the IAM policy"
  type        = string  
}

variable "function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "handler" {
  description = "The name of the Lambda handler"
  type        = string
}

variable "runtime" {
  description = "The runtime of the Lambda function"
  type        = string
}

variable "retention_in_days" {
  description = "The number of days to retain logs in CloudWatch Logs"
  type        = number
  default     = 30  
}
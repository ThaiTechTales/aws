# ----------------
# Provider: AWS
# ----------------
variable "aws_region" {
  description = "The AWS region to deploy the resources."
  type        = string
}

# ----------------
# S3 Bucket
# ----------------
variable "bucket_cloudtrail" {
  description = "The name of the S3 bucket to store CloudTrail logs."
  type        = string
}

variable "bucket_cloudwatch_alarm" {
  description = "The name of the S3 bucket to test the CloudWatch alarm."
  type        = string
}

variable "filter_id" {
  description = "The name of the metric configuration to filter the results."
  type        = string
}


# ----------------
# CloudTrail
# ----------------
variable "cloudtrail_name" {
  description = "The name of the CloudTrail."
  type        = string
}

# ----------------
# CloudWatch
# ----------------
variable "log_group_name" {
  description = "The name of the CloudWatch Logs log group to store CloudTrail logs."
  type        = string
}

variable "alarm_s3_put_request_name" {
  description = "The name of the CloudWatch alarm."
  type        = string
}

variable "alarm_s3_delete_request_name" {
  description = "The name of the CloudWatch alarm."
  type        = string

}

variable "iam_role_name" {
  description = "The name of the IAM role."
  type        = string

}

variable "iam_role_policy_name" {
  description = "The name of the IAM role policy."
  type        = string

}

# ----------------
# SNS Topic
# ----------------
variable "topic_name" {
  description = "The name of the SNS topic."
  type        = string
}

variable "email_address" {
  description = "The email address to receive the SNS notifications."
  type        = string
}
variable "aws_region" {
  description = "The AWS region to deploy the resources."
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket to store CloudTrail logs."
  type        = string
}

variable "test_cloudwatch_alarm_bucket_name" {
  description = "The name of the S3 bucket to test the CloudWatch alarm."
  type        = string
}

variable "cloudtrail_name" {
  description = "The name of the CloudTrail."
  type        = string
}

variable "log_group_name" {
  description = "The name of the CloudWatch Logs log group to store CloudTrail logs."
  type        = string
}
variable "alarm_name" {
  description = "The name of the CloudWatch alarm."
  type        = string
}
variable "metric_name" {
  description = "The name of the CloudWatch metric."
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
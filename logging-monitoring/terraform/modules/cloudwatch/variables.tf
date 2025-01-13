variable "alarm_s3_put_request_name" {
  description = "The name of the alarm"
  type        = string
}

variable "alarm_s3_delete_request_name" {
  description = "The name of the alarm"
  type        = string
}

variable "alarm_ec2_create_name" {
  description = "The name of the filter"
  type        = string
}

variable "alarm_ec2_terminate_name" {
  description = "The name of the filter"
  type        = string
}

variable "alarm_ec2_cpu_utilization_name" {
  description = "The name of the filter"
  type        = string
}

variable "iam_role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "iam_role_policy_name" {
  description = "The name of the IAM role policy"
  type        = string
}

variable "log_group_name" {
  description = "Name of the CloudWatch Log Group"
  type        = string
}

variable "bucket_cloudtrail" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "bucket_cloudwatch_alarm" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "filter_id" {
  description = "The name of the metric configuration to filter the results"
  type        = string
}

variable "sns_topic_s3_cloudwatch" {
  description = "The name of the SNS topic"
  type        = string
}
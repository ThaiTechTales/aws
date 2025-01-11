variable "alarm_name" {
  description = "The name of the alarm"
  type        = string
}

variable "metric_name" {
  description = "The name of the metric"
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
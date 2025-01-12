variable "bucket_cloudtrail" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "cloudwatch_alarm_bucket" {
  description = "The name of the S3 bucket to test the CloudWatch alarm"
  type        = string
}

variable "filter_id" {
  description = "The name of the metric configuration to filter the results"
  type        = string
}
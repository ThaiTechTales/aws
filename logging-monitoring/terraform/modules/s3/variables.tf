variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string

}

variable "test_cloudwatch_alarm_bucket_name" {
  description = "The name of the S3 bucket to test the CloudWatch alarm"
  type        = string
}
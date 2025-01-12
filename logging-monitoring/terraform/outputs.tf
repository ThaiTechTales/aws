output "s3_bucket_cloudtrail_alarm" {
  description = "The name of the S3 bucket where CloudTrail logs are stored"
  value       = module.s3.bucket_cloudtrail
}

output "s3_bucket_cloudwatch_alarm" {
  description = "The name of the S3 bucket where CloudWatch alarms are stored"
  value       = module.s3.bucket_cloudwatch_alarm
}

output "cloudwatch_alarm_s3_put_request_arn" {
  description = "The ARN of the CloudWatch alarm"
  value       = module.cloudwatch.alarm_s3_put_request_arn
}

output "cloudwatch_alarm_s3_delete_request_arn" {
  description = "The ARN of the CloudWatch alarm"
  value       = module.cloudwatch.alarm_s3_delete_request_arn
}

output "cloudwatch_log_group_arn" {
  description = "The ARN of the CloudWatch Log Group"
  value       = module.cloudwatch.log_group_arn
}
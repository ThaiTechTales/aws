output "cloudtrail_bucket" {
  description = "The name of the S3 bucket where CloudTrail logs are stored"  
  value = module.s3.bucket_name
}
output "cloudwatch_alarm" {
  description = "The ARN of the CloudWatch alarm"
  value = module.cloudwatch.alarm_arn
}
output "cloudwatch_log_group_arn" {
  description = "The ARN of the CloudWatch Log Group"
  value = module.cloudwatch.log_group_arn
}
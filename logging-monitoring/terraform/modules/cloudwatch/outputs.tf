output "alarm_s3_put_request_arn" {
  description = "ARN of the CloudWatch alarm"
  value       = aws_cloudwatch_metric_alarm.s3_put_requests.arn
}

output "alarm_s3_delete_request_arn" {
  description = "ARN of the CloudWatch alarm"
  value       = aws_cloudwatch_metric_alarm.s3_delete_requests.arn
}

output "log_group_arn" {
  description = "Name of the CloudWatch Log Group"
  value       = aws_cloudwatch_log_group.cloudtrail_log_group.arn
}

output "iam_role_arn" {
  description = "The IAM role ARN for CloudTrail"
  value       = aws_iam_role.cloudtrail_role.arn
}

output "iam_role_policy" {
  description = "The IAM role policy for CloudTrail"
  value       = aws_iam_role_policy.cloudtrail_policy
}

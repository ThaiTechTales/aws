output "alarm_arn" {
  description = "ARN of the CloudWatch alarm"
  value       = aws_cloudwatch_metric_alarm.alarm.arn
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

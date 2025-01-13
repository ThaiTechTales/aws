output "email_subscription_endpoint" {
  value = aws_sns_topic_subscription.email_subscription.endpoint
}

output "topic_arn" {
  value = aws_sns_topic.s3_cloudwatch_topic.arn
}

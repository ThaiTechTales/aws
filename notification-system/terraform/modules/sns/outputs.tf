output "email_subscription_endpoint" {
  value = aws_sns_topic_subscription.email_subscription.endpoint
}

output "sns_topic_arn" {
  value = aws_sns_topic.sns_topic.arn
}

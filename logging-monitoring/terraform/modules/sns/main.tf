resource "aws_sns_topic" "s3_cloudwatch_topic" {
  name = var.topic_name
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.s3_cloudwatch_topic.arn
  protocol  = "email"
  endpoint  = var.email_address
}
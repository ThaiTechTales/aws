output "sns_topic_arn" {
  value = module.sns.sns_topic_arn
}

output "sqs_queue_url" {
  value = module.sqs.queue_url
}

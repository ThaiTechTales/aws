module "sns" {
  source        = "./modules/sns"
  topic_name    = var.sns_topic_name
  email_address = var.email_address
}

module "sqs" {
  source        = "./modules/sqs"
  queue_name    = var.queue_name
  # dlq_name      = var.dlq_name
  sns_topic_arn = module.sns.sns_topic_arn
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name  
}

module "lambda" {
  source            = "./modules/lambda"
  role_name         = var.role_name
  policy_name       = var.policy_name
  function_name     = var.function_name
  handler           = var.handler
  runtime           = var.runtime
  s3_bucket_name    = module.s3.s3_bucket_name
  s3_bucket_arn     = module.s3.s3_bucket_arn
  email_topic_arn   = module.sns.sns_topic_arn
  sqs_queue_arn     = module.sqs.queue_arn  
  sqs_queue_url     = module.sqs.queue_url
  retention_in_days = var.retention_in_days
}
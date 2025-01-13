module "cloudtrail" {
  source          = "./modules/cloudtrail"
  cloudtrail_name = var.cloudtrail_name

  bucket_name     = module.s3.bucket_cloudtrail
  bucket_policy   = module.s3.bucket_policy
  log_group_arn   = module.cloudwatch.log_group_arn
  iam_role_arn    = module.cloudwatch.iam_role_arn
  iam_role_policy = module.cloudwatch.iam_role_policy.id

  depends_on = [module.cloudwatch]
}

module "cloudwatch" {
  source         = "./modules/cloudwatch"
  log_group_name = var.log_group_name

  alarm_s3_put_request_name      = var.alarm_s3_put_request_name
  alarm_s3_delete_request_name   = var.alarm_s3_delete_request_name
  alarm_ec2_create_name          = var.alarm_ec2_create_name
  alarm_ec2_terminate_name       = var.alarm_ec2_terminate_name
  alarm_ec2_cpu_utilization_name = var.alarm_ec2_cpu_utilization_name

  iam_role_name        = var.iam_role_name
  iam_role_policy_name = var.iam_role_policy_name

  bucket_cloudtrail       = module.s3.bucket_cloudtrail
  bucket_cloudwatch_alarm = module.s3.bucket_cloudwatch_alarm
  filter_id               = module.s3.filter_id

  sns_topic_s3_cloudwatch = module.sns.topic_arn
}

module "s3" {
  source                  = "./modules/s3"
  bucket_cloudtrail       = var.bucket_cloudtrail
  cloudwatch_alarm_bucket = var.bucket_cloudwatch_alarm
  filter_id               = var.filter_id
}

module "ec2" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
}

module "sns" {
  source        = "./modules/sns"
  topic_name    = var.topic_name
  email_address = var.email_address
}


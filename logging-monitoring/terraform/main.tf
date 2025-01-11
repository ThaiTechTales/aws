module "cloudtrail" {
  source          = "./modules/cloudtrail"
  cloudtrail_name = var.cloudtrail_name
  
  bucket_name     = module.s3.bucket_name
  bucket_policy   = module.s3.bucket_policy
  log_group_arn   = module.cloudwatch.log_group_arn
  iam_role_arn    = module.cloudwatch.iam_role_arn  
  iam_role_policy = module.cloudwatch.iam_role_policy.id

  depends_on = [ module.cloudwatch ]
}

module "cloudwatch" {
  source         = "./modules/cloudwatch"
  alarm_name     = var.alarm_name  
  metric_name    = var.metric_name
  log_group_name = var.log_group_name
  iam_role_name = var.iam_role_name
  iam_role_policy_name = var.iam_role_policy_name
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
  test_cloudwatch_alarm_bucket_name = var.test_cloudwatch_alarm_bucket_name
}
resource "aws_cloudtrail" "cloudtrail" {
  name                       = var.cloudtrail_name
  s3_bucket_name             = var.bucket_name
  is_multi_region_trail      = true
  enable_log_file_validation = true
  cloud_watch_logs_group_arn = "${var.log_group_arn}:*" # CloudWatch Logs requires a trailing :*
  cloud_watch_logs_role_arn  = var.iam_role_arn

  # Event selectors are used to specify which events you want to log
  # By default, cloudtrail only logs management events
  # We can specify data events to log as well with the following configuration
  event_selector {
    read_write_type           = "All"
    include_management_events = true

    # Logs all S3 object-level API operations in all s3 buckets
    data_resource {
      type   = "AWS::S3::Object"
      values = ["arn:aws:s3"]
    }
  }
}
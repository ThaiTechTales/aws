output "bucket_cloudtrail" {
  value = aws_s3_bucket.cloudtrail_bucket.id
}

output "bucket_cloudwatch_alarm" {
  value = aws_s3_bucket.cloudwatch_alarm_bucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.cloudtrail_bucket.arn
}

output "bucket_policy" {
  value = aws_s3_bucket_policy.cloudtrail_bucket_policy.policy
}

output "filter_id" {
  value = aws_s3_bucket_metric.cloudwatch_bucket_metric.name

}
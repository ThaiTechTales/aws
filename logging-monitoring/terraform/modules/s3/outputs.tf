output "bucket_name" {
  value = aws_s3_bucket.cloudtrail_bucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.cloudtrail_bucket.arn
}

output "bucket_policy" {
  value = aws_s3_bucket_policy.cloudtrail_bucket_policy.policy
}
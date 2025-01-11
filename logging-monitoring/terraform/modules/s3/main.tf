resource "aws_s3_bucket" "cloudtrail_bucket" {
  bucket = var.bucket_name

  tags = {
    Environment = "Dev"
  }
}


# Test S3 bucket to test Cloudwatch Alar
resource "aws_s3_bucket" "cloudwatch_alarm_bucket" {
  bucket = var.test_cloudwatch_alarm_bucket_name

  tags = {
    Environment = "Dev"
  }
}

# This resource creates a metric configuration for the bucket which will be sent to CloudWatch
# If not specify it will filter all the metrics to be sent to CloudWatch
resource "aws_s3_bucket_metric" "cloudtrail_bucket_metric" {
  bucket = aws_s3_bucket.cloudwatch_alarm_bucket.id
  name   = "EntireBucket"
}

# This bucket policy is required for CloudTrail to write logs to the bucket
# https://docs.aws.amazon.com/awscloudtrail/latest/userguide/create-s3-bucket-policy-for-cloudtrail.html
resource "aws_s3_bucket_policy" "cloudtrail_bucket_policy" {
  bucket = aws_s3_bucket.cloudtrail_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action = "s3:GetBucketAcl" # Access Control List is a list of permissions attached to an object
        Resource = "arn:aws:s3:::${aws_s3_bucket.cloudtrail_bucket.id}"
      },
      {
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action = "s3:PutObject"
        Resource = "arn:aws:s3:::${aws_s3_bucket.cloudtrail_bucket.id}/AWSLogs/${data.aws_caller_identity.current.account_id}/*"
        
        # This condition is required to ensure that the bucket owner has full control over the objects
        Condition = {
          StringEquals = {
            # s3:x-amz-acl is a header that allows the bucket owner to have full control over the object
            "s3:x-amz-acl": "bucket-owner-full-control"
          }
        }
      }
    ]
  })
}

# Data allows us to retrieve information about the current AWS account
# This block is required to get the account ID for the bucket policy and this block is not required to be configured
data "aws_caller_identity" "current" {}

resource "aws_s3_bucket_versioning" "cloudtrail_bucket_versioning" {
  bucket = aws_s3_bucket.cloudtrail_bucket.bucket

  versioning_configuration {
    status = "Enabled"
  }
}
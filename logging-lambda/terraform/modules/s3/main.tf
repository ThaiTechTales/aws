resource "aws_s3_bucket" "lambda_code_bucket" {
  bucket = var.bucket_name # Name of the S3 bucket

  tags = {
    Name        = var.bucket_name
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "lambda_code_bucket_versioning" {
  bucket = aws_s3_bucket.lambda_code_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
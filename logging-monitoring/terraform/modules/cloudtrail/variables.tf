variable "cloudtrail_name" {
  description = "Name of the CloudTrail"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "bucket_policy" {
  description = "The bucket policy"
  type        = string  
}

variable "log_group_arn" {
  description = "The ARN of the CloudWatch Log Group"
  type        = string  
}

variable "iam_role_arn" {
  description = "The IAM role ARN for CloudTrail"
  type        = string    
}

variable "iam_role_policy" {
  description = "The IAM role policy for CloudTrail"
  type        = string      
}
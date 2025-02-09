variable "kinesis_stream_arn" {
  description = "The ARN of the Kinesis stream to trigger the Lambda function"
  type        = string
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table to store processed IoT data"
  type        = string
}

variable "role_name" {
  description = "The name of the IAM role for the Lambda function"
  type        = string

}

variable "policy_name" {
  description = "The name of the IAM role policy for the Lambda function"
  type        = string

}

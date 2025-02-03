variable "aws_region" {
  description = "The AWS region to deploy resources in"
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table to store processed IoT data"
  type        = string
}

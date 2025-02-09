variable "aws_region" {
  description = "The AWS region to deploy resources in"
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table to store processed IoT data"
  type        = string
}

variable "glue_role_name" {
  description = "The name of the IAM role for Glue ETL"
  type        = string
}

variable "glue_policy_name" {
  description = "The name of the IAM role policy for Glue ETL"
  type        = string
}

variable "iot_role_name" {
  description = "The name of the IAM role for IoT"
  type        = string
}

variable "iot_policy_name" {
  description = "The name of the IoT policy"
  type        = string
}

variable "kinesis_stream_name" {
  description = "The name of the Kinesis stream to route IoT data"
  type        = string
}

variable "lambda_role_name" {
  description = "The name of the IAM role for the Lambda function"
  type        = string

}

variable "lambda_policy_name" {
  description = "The name of the IAM role policy for the Lambda function"
  type        = string

}

variable "glue_crawler_name" {
  description = "The name of the Glue crawler"
  type        = string

}

variable "redshift_cluster_name" {
  description = "The name of the Redshift cluster to store processed IoT data"
  type        = string

}

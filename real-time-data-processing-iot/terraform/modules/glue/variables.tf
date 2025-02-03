variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table for Glue ETL"
  type        = string

}

variable "role_name" {
  description = "The name of the IAM role for Glue ETL"
  type        = string
}

variable "policy_name" {
  description = "The name of the IAM role policy for Glue ETL"
  type        = string

}

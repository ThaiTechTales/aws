variable "kinesis_stream_name" {
  description = "The name of the Kinesis stream to route IoT data"
  type        = string
}

variable "role_name" {
  description = "The name of the IAM role to create for IoT"
  type        = string
}

variable "policy_name" {
  description = "The name of the IoT policy to create"
  type        = string

}

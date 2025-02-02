variable "policy_name" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "role_with_aws_managed_policy" {
  type = string
}

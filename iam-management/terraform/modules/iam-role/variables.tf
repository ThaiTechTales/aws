variable "role_names" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}

variable "role_with_aws_managed_policy_name" {
  type = string
}

variable "policy_names" {
  type = map(string)
}

variable "tags" {
  type = map(string)
}

variable "role_with_aws_managed_policy" {
  type = string
}

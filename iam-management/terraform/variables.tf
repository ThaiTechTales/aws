# ----------------
# Provider
# ----------------
variable "aws_region" {
  type = string
}

# ----------------
# Common
# ----------------
variable "tags" {
  type = map(string)
}

# ----------------
# IAM Group
# ----------------
variable "iam_group_names" {
  type = list(string)
}

# ----------------
# IAM User
# ----------------
variable "iam_user_names" {
  type = list(string)
}

# ----------------
# IAM Role
# ----------------
variable "role_names" {
  type = list(string)
}

# ----------------
# IAM Policy
# ----------------
variable "policy_names" {
  type = map(string)
}

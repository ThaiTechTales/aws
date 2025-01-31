output "role_arns" {
  value = [for role in aws_iam_role.this : role.arn]
}

output "role_with_aws_managed_policy_arn" {
  value = aws_iam_role.role_with_aws_managed_policy.id
}

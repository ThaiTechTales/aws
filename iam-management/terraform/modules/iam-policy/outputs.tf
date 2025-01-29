output "policy_arns" {
  value = [for policy in aws_iam_policy.this : policy.arn]
}

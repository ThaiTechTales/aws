output "group_arns" {
  value = [for group in aws_iam_group.this : group.arn]
}

output "group_names" {
  value = [for group in aws_iam_group.this : group.name]
}

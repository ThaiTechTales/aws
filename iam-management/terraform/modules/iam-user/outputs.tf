output "user_arns" {
  value = [for user in aws_iam_user.this : user.arn]
}

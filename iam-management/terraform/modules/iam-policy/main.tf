resource "aws_iam_policy" "this" {
  for_each = var.policy_names
  name     = each.key
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "s3:ListBucket"
        Resource = "*"
      }
    ]
  })
  tags = var.tags
}

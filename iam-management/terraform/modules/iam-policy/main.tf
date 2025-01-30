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

resource "aws_iam_role_policy_attachment" "s3_read_only_access" {
  role       = var.role_with_aws_managed_policy
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

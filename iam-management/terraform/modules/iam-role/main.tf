resource "aws_iam_role" "this" {
  for_each = toset(var.role_names)
  name     = each.key
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
  tags = var.tags
}

# Role with AWS Managed Policy
resource "aws_iam_role" "role_with_aws_managed_policy" {
  name = var.role_with_aws_managed_policy_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"

        # Define who the policy applies to.
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
  tags = var.tags
}

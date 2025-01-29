resource "aws_iam_user" "this" {
  for_each = toset(var.user_names)
  name     = each.key
  tags     = var.tags
}

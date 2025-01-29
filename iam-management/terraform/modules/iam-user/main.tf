resource "aws_iam_user" "this" {
  for_each = toset(var.users)
  name     = each.key
  tags     = var.tags
}

resource "aws_iam_group" "this" {
  for_each = toset(var.groups)
  name     = each.key
}

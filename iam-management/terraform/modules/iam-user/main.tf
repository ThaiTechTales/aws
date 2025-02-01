resource "aws_iam_user" "this" {
  for_each = toset(var.user_names)
  name     = each.key
  tags     = var.tags
}

resource "aws_iam_user" "user_with_groups" {
  name = "user-with-groups"
  tags = var.tags
}

resource "aws_iam_user_group_membership" "user_group_membership" {
  user   = aws_iam_user.user_with_groups.name
  groups = var.groups
}

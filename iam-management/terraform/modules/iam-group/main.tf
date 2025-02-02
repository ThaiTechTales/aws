resource "aws_iam_group" "this" {
  for_each = toset(var.group_names)
  name     = each.key
}

resource "aws_iam_group_policy_attachment" "this" {
  for_each   = toset(var.group_names)
  group      = aws_iam_group.this[each.key].name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

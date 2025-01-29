module "iam_groups" {
  source      = "./modules/iam-group"
  group_names = var.iam_group_names
}

module "iam_users" {
  source     = "./modules/iam-user"
  user_names = var.iam_user_names
  tags       = var.tags
}

module "iam_roles" {
  source     = "./modules/iam-role"
  role_names = var.role_names
  tags       = var.tags
}

module "iam_policies" {
  source       = "./modules/iam-policy"
  policy_names = var.policy_names
  tags         = var.tags
}

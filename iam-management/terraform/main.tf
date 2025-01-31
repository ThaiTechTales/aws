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
  source                            = "./modules/iam-role"
  role_names                        = var.role_names
  role_with_aws_managed_policy_name = var.role_with_aws_managed_policy_name
  tags                              = var.tags
}

module "iam_policies" {
  source                       = "./modules/iam-policy"
  policy_name                  = var.policy_name
  tags                         = var.tags
  role_with_aws_managed_policy = module.iam_roles.role_with_aws_managed_policy_arn
}

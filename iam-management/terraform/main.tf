module "iam_users" {
  source = "./modules/iam-user"
  users  = ["developer", "deployer", "reader"]
  tags   = var.tags
}

module "iam_groups" {
  source = "./modules/iam-group"
  groups = ["developers", "admins"]
}

module "iam_roles" {
  source = "./modules/iam-role"
  roles  = ["ec2-access-role"]
  tags   = var.tags
}

module "iam_policies" {
  source = "./modules/iam-policy"
  policies = {
    readonly = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  }
  tags = var.tags
}

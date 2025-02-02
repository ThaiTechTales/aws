output "iam_user_arns" {
  value = module.iam_users.user_arns
}

output "iam_group_arns" {
  value = module.iam_groups.group_arns
}

output "iam_role_arns" {
  value = module.iam_roles.role_arns
}

output "iam_policy_arns" {
  value = module.iam_policies.policy_arns
}

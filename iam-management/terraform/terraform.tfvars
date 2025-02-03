# ----------------
# Provider: AWS
# ----------------
aws_region = "ap-southeast-2"

# ----------------
# Tags
# ----------------
tags = {
  Environment = "dev"
  Project     = "iam management"
}

# ----------------
# IAM Group
# ----------------
iam_group_names = ["developers", "deployers", "readers"]

# ----------------
# IAM User
# ----------------
iam_user_names = ["developer-01", "deployer-01", "reader-01"]

# ----------------
# IAM Role
# ----------------
role_names                        = ["role-dev-apse2-ec2-access-01", "role-dev-apse2-s3-access-01"]
role_with_aws_managed_policy_name = "role-dev-apse2-amazon-managed-policy-01"

# ----------------
# IAM Policy
# ----------------
policy_name = "policy-dev-apse2-s3-list-bucket-01"

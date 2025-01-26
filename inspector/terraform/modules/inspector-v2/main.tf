# Enable Inspector V2 for EC2 Instances
resource "aws_inspector2_enabler" "ec2" {
  account_ids    = [data.aws_caller_identity.current.account_id]
  resource_types = ["EC2"]
}

# Data source to retrieve the current account information
data "aws_caller_identity" "current" {}
# ----------------
# Provider: AWS
# ----------------
variable "aws_region" {
  description = "The AWS region to deploy the resources."
  type        = string
}

# ----------------
# Module: inspector
# ----------------
variable "duration" {
  description = "The duration of the inspector assessment."
  type        = number
}

variable "assessment_target_name" {
  description = "The name of the inspector target."
  type        = string
}

variable "assessment_template_name" {
  description = "The name of the inspector assessment."
  type        = string
}

# ----------------
# Module: ec2 & asg
# ----------------
variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "The instance type to use for the EC2 instance."
  type        = string
}

variable "environment" {
  description = "The environment of the EC2 instances."
  type        = string
}

# ----------------
# Module: ec2
# ----------------

variable "standalone-ec2_with_tags_name" {
  description = "The name of the EC2 instance."
  type        = string
}

variable "standalone-ec2_without_tags_name" {
  description = "The name of the EC2 instance."
  type        = string

}

variable "standalone_ec2_role_name" {
  description = "The IAM role name for the EC2 instance."
  type        = string
}

# ----------------
# Module: asg
# ----------------

variable "asg-ec2-name" {
  description = "The name of the EC2 instances."
  type        = string
}

variable "min_size" {
  description = "The minimum number of EC2 instances in the ASG."
  type        = number
}

variable "max_size" {
  description = "The maximum number of EC2 instances in the ASG."
  type        = number
}

variable "desired_capacity" {
  description = "The desired number of EC2 instances in the ASG."
  type        = number
}

variable "subnet_ids" {
  description = "The subnet IDs to deploy the EC2 instances."
  type        = list(string)
}

variable "asg_role_name" {
  description = "The IAM role name for the EC2 instances."
  type        = string
}
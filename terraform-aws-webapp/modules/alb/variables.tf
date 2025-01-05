variable "subnet_ids" {
  description = "List of subnet IDs for the ALB"
  type        = list(string)
}

variable "security_group_id" {
  description = "The ID of the security group for the ALB"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "instance_id" {
  description = "The ID of the EC2 instance to attach to the target group"
  type        = string
}
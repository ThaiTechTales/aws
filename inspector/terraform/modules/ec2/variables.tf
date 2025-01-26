variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}

variable "ec2_with_tags_name" {
  description = "EC2 instance name"
  type        = string
}

variable "ec2_without_tags_name" {
  description = "EC2 instance name"
  type        = string
}

variable "environment" {
  description = "Environment tag for EC2 instance"
  type        = string
  default     = "dev"
}

variable "role_name" {
  description = "IAM role name for EC2 instance"
  type        = string  
}
variable "ami_id" {
  description = "AMI ID for ASG instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for ASG instances"
  type        = string
  default     = "t2.micro"
}

variable "name" {
  description = "ASG name prefix"
  type        = string
}

variable "min_size" {
  description = "Minimum number of instances"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of instances"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "Desired number of instances"
  type        = number
  default     = 2  
}

variable "environment" {
  description = "Environment tag for ASG instances"
  type        = string
  default     = "dev"
}

variable "subnet_ids" {
  description = "Subnet IDs for ASG instances"
  type        = list(string)
}

variable "role_name" {
  description = "IAM role name for ASG instances"
  type        = string  
}
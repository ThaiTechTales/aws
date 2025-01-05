variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "ap-southeast-2" # Sydney
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "A list of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "enable_nat_gateway" {
  description = "Whether to create a NAT Gateway"
  type        = bool
  default     = false
}

variable "azs" {
  description = "A list of Availability Zones for the subnets"
  type        = list(string)
  default     = ["ap-southeast-2a", "ap-southeast-2b"]
}

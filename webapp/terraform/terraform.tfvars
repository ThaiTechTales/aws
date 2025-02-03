# AWS Region where resources will be deployed
aws_region = "ap-southeast-2"

# CIDR block for the VPC
vpc_cidr = "10.0.0.0/16"

# List of CIDR blocks for public subnets
public_subnets = [
    "10.0.1.0/24",
    "10.0.2.0/24"
]

# Availability Zones for the subnets
azs = [
    "ap-southeast-2a",
    "ap-southeast-2b"
]

# AMI ID for the EC2 instance
ami_id = "ami-0d6560f3176dc9ec0" # Amazon Linux 2 AMI

# Instance type for the EC2 instance
instance_type = "t2.micro"
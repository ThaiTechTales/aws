output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc-dev-apse2-main-01.id
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = [for subnet in aws_subnet.subnet-dev-apse2-ec2-01 : subnet.id]
}

output "public_subnet_cidrs" {
  description = "List of CIDR blocks of public subnets"
  value       = [for subnet in aws_subnet.subnet-dev-apse2-ec2-01 : subnet.cidr_block]
}

output "security_group_id" {
  description = "The ID of the security group"
  value = aws_security_group.security-group-dev-apse2-01.id
}
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.ec2-dev-apse2-web-01.id
}

output "public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.ec2-dev-apse2-web-01
}
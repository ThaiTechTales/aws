output "inspector_ec2_status" {
  description = "Inspector EC2 scanning status"
  value       = aws_inspector2_enabler.ec2.status
}
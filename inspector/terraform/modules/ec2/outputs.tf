output "ec2_with_tags_instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.ec2_with_tags.*.id # The splat operator (*) is used to return a list of all the IDs
}

output "ec2_without_tags_instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.ec2_without_tags.*.id # The splat operator (*) is used to return a list of all the IDs
}
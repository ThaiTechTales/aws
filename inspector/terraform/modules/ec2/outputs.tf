output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.this.*.id # The splat operator (*) is used to return a list of all the IDs
}
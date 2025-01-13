# Map of EC2 instance IDs
output "instance_ids_map" {
  description = "Map of EC2 instance IDs"
  value = {
    for idx, id in aws_instance.ec2-dev-apse2-cloudwatch-test-01[*].id :
    idx => id
  }
}
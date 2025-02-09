resource "aws_redshift_cluster" "iot_redshift" {
  cluster_identifier = var.redshift_cluster_name
  node_type          = "dc2.large"
  master_username    = "admin"
  master_password    = "Admin123456!"
  cluster_type       = "single-node"

  skip_final_snapshot = true # Don't need a snapshot when we destroy the cluster
}

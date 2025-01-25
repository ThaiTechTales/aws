module "inspector" {
  source   = "./modules/inspector"
  duration = var.duration
}

module "ec2" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  name          = var.standalone-ec2-name
  environment   = var.environment
  role_name     = var.standalone_ec2_role_name
}

module "asg" {
  source           = "./modules/asg"
  ami_id           = var.ami_id
  instance_type    = var.instance_type
  name             = var.asg-ec2-name
  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = var.desired_capacity
  environment      = var.environment
  subnet_ids       = var.subnet_ids
  role_name        = var.asg_role_name
}
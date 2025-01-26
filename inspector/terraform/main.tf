module "inspector-v2" {
  source                   = "./modules/inspector-v2"
  duration                 = var.duration
  assessment_target_name   = var.assessment_target_name
  assessment_template_name = var.assessment_template_name  
}

module "inspector-classic" {
  source                   = "./modules/inspector-classic"
  duration                 = var.duration
  assessment_target_name   = var.assessment_target_name
  assessment_template_name = var.assessment_template_name
}

module "ec2" {
  source                = "./modules/ec2"
  ami_id                = var.ami_id
  ec2_with_tags_name    = var.standalone-ec2_with_tags_name
  ec2_without_tags_name = var.standalone-ec2_without_tags_name
  instance_type         = var.instance_type
  environment           = var.environment
  role_name             = var.standalone_ec2_role_name
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
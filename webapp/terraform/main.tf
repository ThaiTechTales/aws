module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  public_subnets      = var.public_subnets
  azs                 = var.azs
}

module "ec2" {
  source            = "./modules/ec2"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.vpc.public_subnet_ids[0]
  security_group_id = module.vpc.security_group_id
  vpc_id            = module.vpc.vpc_id
}

module "alb" {
  source            = "./modules/alb"
  subnet_ids        = module.vpc.public_subnet_ids
  security_group_id = module.vpc.security_group_id
  vpc_id            = module.vpc.vpc_id
  instance_id       = module.ec2.instance_id
}
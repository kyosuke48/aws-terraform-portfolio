# VPC Module
module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
}

# Security Group Module
module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

# EC2 Module
module "ec2" {
  source            = "./modules/ec2"
  public_subnet_id  = module.vpc.public_subnet_id
  private_subnet_id = module.vpc.private_subnet_id
  sg_web_id         = module.security_group.sg_web_id
  sg_ap_id          = module.security_group.sg_ap_id
  sg_zabbix_id       = module.security_group.sg_zabbix_id
  instance_type     = var.instance_type
}

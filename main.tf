# VPC Module
module "vpc" {
  source                 = "./modules/vpc"
  project_name           = var.project_name
  vpc_cidr               = var.vpc_cidr
  public_subnet_cidr     = var.public_subnet_cidr
  private_ap_subnet_cidr = var.private_ap_subnet_cidr
  private_db_subnet_cidr = var.private_db_subnet_cidr
  availability_zone      = var.availability_zone
  endpoint_sg_id         = module.security_group.endpoint_sg_id
}

# Security Group Module
module "security_group" {
  source       = "./modules/security_group"
  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
  vpc_cidr = var.vpc_cidr
}

# EC2 Module
module "ec2" {
  source               = "./modules/ec2"
  project_name         = var.project_name
  public_subnet_id     = module.vpc.public_subnet_id
  private_ap_subnet_id = module.vpc.private_ap_subnet_id
  private_db_subnet_id = module.vpc.private_db_subnet_id
  sg_web_id            = module.security_group.sg_web_id
  sg_ap_id             = module.security_group.sg_ap_id
  sg_db_id             = module.security_group.sg_db_id
  instance_type        = var.instance_type
}

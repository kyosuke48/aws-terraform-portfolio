# VPC Module
module "vpc" {
  source                     = "./modules/vpc"
  project_name               = var.project_name
  vpc_cidr                   = var.vpc_cidr
  az_1a                      = var.az_1a
  az_1c                      = var.az_1c
  public_subnet_1a_cidr      = var.public_subnet_1a_cidr
  public_subnet_1c_cidr      = var.public_subnet_1c_cidr
  private_web_subnet_1a_cidr = var.private_web_subnet_1a_cidr
  private_web_subnet_1c_cidr = var.private_web_subnet_1c_cidr
  private_ap_subnet_1a_cidr     = var.private_ap_subnet_1a_cidr
  private_ap_subnet_1c_cidr  = var.private_ap_subnet_1c_cidr
  private_db_subnet_1a_cidr  = var.private_db_subnet_1a_cidr
  private_db_subnet_1c_cidr  = var.private_db_subnet_1c_cidr
  endpoint_sg_id             = module.security_group.endpoint_sg_id
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
  source                   = "./modules/ec2"
  project_name             = var.project_name
  instance_type            = var.instance_type
  private_web_subnet_1a_id = module.vpc.private_web_subnet_1a_id
  private_web_subnet_1c_id = module.vpc.private_web_subnet_1c_id
  private_ap_subnet_1a_id  = module.vpc.private_ap_subnet_1a_id
  private_ap_subnet_1c_id  = module.vpc.private_ap_subnet_1c_id
  sg_web_id            = module.security_group.sg_web_id
  sg_ap_id             = module.security_group.sg_ap_id
}

# ALB Module
module "alb" {
  source            = "./modules/alb"
  project_name      = var.project_name
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  sg_alb_id         = module.security_group.sg_alb_id
  web_instance_ids  = module.ec2.web_instance_ids
}

# RDS Module
module "rds" {
  source         = "./modules/rds"
  project_name   = var.project_name
  subnet_ids     = module.vpc.private_db_subnet_ids
  sg_db_id       = module.security_group.sg_db_id
  instance_class = var.db_instance_class
}

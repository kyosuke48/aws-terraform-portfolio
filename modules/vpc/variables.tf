variable "project_name" {
  type        = string
  description = "Project Name"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
}

variable "public_subnet_cidr" {
  type        = string
  description = "Public Subnet CIDR"
}

variable "private_ap_subnet_cidr" {
  type        = string
  description = "Private AP Subnet CIDR"
}

variable "private_db_subnet_cidr" {
  type        = string
  description = "Private DB Subnet CIDR"
}

variable "availability_zone" {
  type        = string
  description = "Availability Zone"
}

variable "endpoint_sg_id" {
  description = "Security Group ID for VPC Endpoints"
  type        = string
}


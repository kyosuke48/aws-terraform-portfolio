variable "project_name" {
  type        = string
  description = "Project Name"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
}

variable "az_1a" {
  type        = string
  description = "Availability Zone A"
  default     = "ap-northeast-1a"
}

variable "az_1c" {
  type        = string
  description = "Availability Zone C"
  default     = "ap-northeast-1c"
}

variable "public_subnet_1a_cidr" {
  type        = string
  description = "Public Subnet 1a CIDR"
}

variable "public_subnet_1c_cidr" {
  type        = string
  description = "Public Subnet 1c CIDR"
}

# Private Web Subnets (10.0.11.0/24, 10.0.12.0/24)
variable "private_web_subnet_1a_cidr" {
  type        = string
  description = "Private Web Subnet 1a CIDR"
}

variable "private_web_subnet_1c_cidr" {
  type        = string
  description = "Private Web Subnet 1c CIDR"
}

# Private AP Subnets (10.0.21.0/24, 10.0.22.0/24)
variable "private_ap_subnet_1a_cidr" {
  type        = string
  description = "Private AP Subnet 1a CIDR"
}

variable "private_ap_subnet_1c_cidr" {
  type        = string
  description = "Private AP Subnet 1c CIDR"
}

# Private DB Subnets (10.0.31.0/24, 10.0.32.0/24)
variable "private_db_subnet_1a_cidr" {
  type        = string
  description = "Private DB Subnet 1a CIDR"
}

variable "private_db_subnet_1c_cidr" {
  type        = string
  description = "Private DB Subnet 1c CIDR"
}

variable "endpoint_sg_id" {
  description = "Security Group ID for VPC Endpoints"
  type        = string
}


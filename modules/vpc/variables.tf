variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
}

variable "public_subnet_cidr" {
  type        = string
  description = "Public Subnet CIDR"
}

variable "private_subnet_cidr" {
  type        = string
  description = "Private Subnet CIDR"
}

variable "availability_zone" {
  type        = string
  description = "Availability Zone"
}

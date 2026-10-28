variable "project_name" {
  type        = string
  description = "Project Nameを指定します"
}

variable "region" {
  type    = string
  default = "ap-northeast-1"
  description = "Regionを指定します"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
  description = "VPCのCIDRブロックを指定します"
}

variable "az_1a" {
  type        = string
  default     = "ap-northeast-1a"
  description = "Availability Zone A"
}

variable "az_1c" {
  type        = string
  default     = "ap-northeast-1c"
  description = "Availability Zone C"
}

variable "public_subnet_1a_cidr" {
  type    = string
  default = "10.0.1.0/24"
  description = "public_subnet 1a のCIDRブロックを指定します"
}

variable "public_subnet_1c_cidr" {
  type        = string
  default     = "10.0.2.0/24"
  description = "Public Subnet 1c のCIDRブロックを指定します"
}

variable "private_web_subnet_1a_cidr" {
  type        = string
  default     = "10.0.11.0/24"
  description = "Private Web Subnet 1a のCIDRを指定します"
}

variable "private_web_subnet_1c_cidr" {
  type        = string
  default     = "10.0.12.0/24"
  description = "Private Web Subnet 1c のCIDRを指定します"
}

variable "private_ap_subnet_1a_cidr" {
  type    = string
  default = "10.0.21.0/24"
  description = "private_subnet 1a のCIDRブロックを指定します"
}

variable "private_ap_subnet_1c_cidr" {
  type        = string
  default     = "10.0.22.0/24"
  description = "Private AP Subnet 1c のCIDRブロックを指定します"
}

variable "private_db_subnet_1a_cidr" {
  type        = string
  default     = "10.0.31.0/24"
  description = "private_db_subnetのCIDRブロックを指定します"
}

variable "private_db_subnet_1c_cidr" {
  type        = string
  default     = "10.0.32.0/24"
  description = "Private DB Subnet 1c のCIDRブロックを指定します"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
  description = "インスタンスタイプを指定します"
}

variable "db_instance_class" {
  type        = string
  default     = "db.t3.micro"
  description = "RDSインスタンスクラスを指定します"
}

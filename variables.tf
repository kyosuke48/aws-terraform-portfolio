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

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
  description = "public_subnetのCIDRブロックを指定します"
}

variable "private_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
  description = "private_subnetのCIDRブロックを指定します"
}

variable "availability_zone" {
  type    = string
  default = "ap-northeast-1a"
  description = "AZを指定します"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
  description = "インスタンスタイプを指定します"
}

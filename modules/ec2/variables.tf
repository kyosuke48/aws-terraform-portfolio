variable "public_subnet_id" {
  type        = string
  description = "Public Subnet ID"
}

variable "private_subnet_id" {
  type        = string
  description = "Private Subnet ID"
}

variable "sg_web_id" {
  type        = string
  description = "Web Security Group ID"
}

variable "sg_ap_id" {
  type        = string
  description = "AP Security Group ID"
}

variable "sg_zabbix_id" {
  type        = string
  description = "Zabbix Security Group ID"
}

variable "instance_type" {
  type        = string
  description = "EC2 Instance Type"
}

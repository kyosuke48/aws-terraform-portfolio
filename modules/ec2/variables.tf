variable "project_name" {
  type        = string
  description = "Project Name"
}

variable "public_subnet_id" {
  type        = string
  description = "Public Subnet ID"
}

variable "private_ap_subnet_id" {
  type        = string
  description = "Private AP Subnet ID"
}

variable "private_db_subnet_id" {
  type        = string
  description = "Private DB Subnet ID"
}

variable "sg_web_id" {
  type        = string
  description = "Web Security Group ID"
}

variable "sg_ap_id" {
  type        = string
  description = "AP Security Group ID"
}

variable "sg_db_id" {
  type        = string
  description = "DB Security Group ID"
}

variable "instance_type" {
  type        = string
  description = "EC2 Instance Type"
}

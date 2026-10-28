variable "project_name" {
  type        = string
  description = "Project Name"
}

variable "private_web_subnet_1a_id" {
  type        = string
  description = "Private WEB Subnet 1a ID"
}

variable "private_web_subnet_1c_id" {
  type        = string
  description = "Private Web Subnet 1c ID"
}

variable "private_ap_subnet_1a_id" {
  type        = string
  description = "Private AP Subnet 1a ID"
}

variable "private_ap_subnet_1c_id" {
  type        = string
  description = "Private AP Subnet 1c ID"
}

variable "sg_web_id" {
  type        = string
  description = "Web Security Group ID"
}

variable "sg_ap_id" {
  type        = string
  description = "AP Security Group ID"
}

variable "instance_type" {
  type        = string
  description = "EC2 Instance Type"
}

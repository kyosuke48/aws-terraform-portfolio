variable "project_name" {
  type        = string
  description = "Project Name"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "Public Subnet IDs (ap-northeast-1a and 1c) for ALB"
}

variable "sg_alb_id" {
  type        = string
  description = "Security Group ID for ALB"
}

variable "web_instance_ids" {
  type        = list(string)
  description = "List of Web instance IDs to register to Target Group"
}

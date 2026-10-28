variable "project_name" {
  type        = string
  description = "Project Name"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of DB Subnet IDs (ap-northeast-1a and 1c)"
}

variable "sg_db_id" {
  type        = string
  description = "Security Group ID for DB"
}

variable "instance_class" {
  type        = string
  description = "RDS Instance Class"
  default     = "db.t3.micro"
}

variable "db_name" {
  type        = string
  description = "Database Name"
  default     = "appdb"
}

variable "db_username" {
  type        = string
  description = "Database Master Username"
  default     = "admin"
}

variable "db_password" {
  type        = string
  description = "Database Master Password"
  sensitive   = true
  default     = "Password1234!"
}

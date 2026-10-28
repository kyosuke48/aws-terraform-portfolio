# ALB (外部アクセス用エンドポイント)
output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = module.alb.alb_dns_name
}

# Web Servers (Private IP)
output "web_1a_private_ip" {
  description = "Private IP of Web server 1a"
  value       = module.ec2.web_1a_private_ip
}

output "web_1c_private_ip" {
  description = "Private IP of Web server 1c"
  value       = module.ec2.web_1c_private_ip
}

# AP Servers (Private IP)
output "ap_1a_private_ip" {
  description = "Private IP of AP server 1a"
  value       = module.ec2.ap_1a_private_ip
}

output "ap_1c_private_ip" {
  description = "Private IP of AP server 1c"
  value       = module.ec2.ap_1c_private_ip
}

# RDS Multi-AZ
output "rds_endpoint" {
  description = "Connection Endpoint of RDS Multi-AZ"
  value       = module.rds.db_endpoint
}

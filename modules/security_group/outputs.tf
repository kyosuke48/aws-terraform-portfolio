output "sg_alb_id" {
  value       = aws_security_group.alb.id
  description = "Security Group ID for ALB"
}

output "sg_web_id" {
  value = aws_security_group.web.id
  description = "Security Group ID for Web Server"
}

output "sg_ap_id" {
  value = aws_security_group.ap.id
  description = "Security Group ID for AP Server"
}

output "sg_db_id" {
  value = aws_security_group.db.id
  description = "Security Group ID for DB Server"
}

output "endpoint_sg_id" {
  value       = aws_security_group.endpoint_sg.id
  description = "Security Group ID for VPC Endpoints"
}

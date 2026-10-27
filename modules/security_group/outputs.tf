output "sg_web_id" {
  value = aws_security_group.web.id
}

output "sg_ap_id" {
  value = aws_security_group.ap.id
}

output "sg_db_id" {
  value = aws_security_group.db.id
}

output "endpoint_sg_id" {
  description = "Security Group ID for VPC Endpoints"
  value       = aws_security_group.endpoint_sg.id
}

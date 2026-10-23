output "sg_web_id" {
  value = aws_security_group.web.id
}

output "sg_ap_id" {
  value = aws_security_group.ap.id
}

output "sg_db_id" {
  value = aws_security_group.db.id
}

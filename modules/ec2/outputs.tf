# Web Server IDs (ALB Target Group 登録用)
output "web_instance_ids" {
  description = "IDs of Web instances"
  value       = [aws_instance.web_1a.id, aws_instance.web_1c.id]
}

output "web_1a_id" {
  description = "ID of Web instance 1a"
  value       = aws_instance.web_1a.id
}

output "web_1c_id" {
  description = "ID of Web instance 1c"
  value       = aws_instance.web_1c.id
}

# Private IPs
output "web_1a_private_ip" {
  description = "Private IP of Web server 1a"
  value       = aws_instance.web_1a.private_ip
}

output "web_1c_private_ip" {
  description = "Private IP of Web server 1c"
  value       = aws_instance.web_1c.private_ip
}

output "ap_1a_private_ip" {
  description = "Private IP of AP server 1a"
  value       = aws_instance.ap_1a.private_ip
}

output "ap_1c_private_ip" {
  description = "Private IP of AP server 1c"
  value       = aws_instance.ap_1c.private_ip
}

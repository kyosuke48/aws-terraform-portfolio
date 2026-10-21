output "web_public_ip" {
  value = aws_eip.web.public_ip
}

output "web_private_ip" {
  value = aws_instance.web.private_ip
}

output "ap_private_ip" {
  value = aws_instance.ap.private_ip
}

output "zabbix_private_ip" {
  value = aws_instance.zabbix.private_ip
}

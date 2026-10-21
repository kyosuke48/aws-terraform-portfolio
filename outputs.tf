output "web_public_ip" {
  description = "Web Server Public EIP"
  value       = module.ec2.web_public_ip
}

output "web_private_ip" {
  description = "Web Server Private IP"
  value       = module.ec2.web_private_ip
}

output "ap_private_ip" {
  description = "AP Server Private IP"
  value       = module.ec2.ap_private_ip
}

output "zabbix_private_ip" {
  description = "Zabbix Server Private IP"
  value       = module.ec2.zabbix_private_ip
}

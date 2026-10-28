output "db_instance_id" {
  description = "RDS Instance ID"
  value       = aws_db_instance.main.id
}

output "db_endpoint" {
  description = "RDS Connection Endpoint"
  value       = aws_db_instance.main.endpoint
}

output "db_address" {
  description = "RDS Hostname (Address)"
  value       = aws_db_instance.main.address
}

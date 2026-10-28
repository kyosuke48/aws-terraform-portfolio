output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

# Public Subnet IDs (ALB用)
output "public_subnet_1a_id" {
  description = "Public Subnet 1a ID"
  value       = aws_subnet.public_1a.id
}

output "public_subnet_1c_id" {
  description = "Public Subnet 1c ID"
  value       = aws_subnet.public_1c.id
}

output "public_subnet_ids" {
  description = "List of Public Subnet IDs for ALB"
  value       = [aws_subnet.public_1a.id, aws_subnet.public_1c.id]
}

# Private Web Subnet IDs
output "private_web_subnet_1a_id" {
  description = "Private Web Subnet 1a ID"
  value       = aws_subnet.private_web_1a.id
}

output "private_web_subnet_1c_id" {
  description = "Private Web Subnet 1c ID"
  value       = aws_subnet.private_web_1c.id
}

output "private_web_subnet_ids" {
  description = "List of Private Web Subnet IDs"
  value       = [aws_subnet.private_web_1a.id, aws_subnet.private_web_1c.id]
}

# Private AP Subnet IDs
output "private_ap_subnet_1a_id" {
  description = "Private AP Subnet 1a ID"
  value       = aws_subnet.private_ap_1a.id
}

output "private_ap_subnet_1c_id" {
  description = "Private AP Subnet 1c ID"
  value       = aws_subnet.private_ap_1c.id
}

output "private_ap_subnet_ids" {
  description = "List of Private AP Subnet IDs"
  value       = [aws_subnet.private_ap_1a.id, aws_subnet.private_ap_1c.id]
}

# Private DB Subnet IDs (RDS用)
output "private_db_subnet_1a_id" {
  description = "Private DB Subnet 1a ID"
  value       = aws_subnet.private_db_1a.id
}

output "private_db_subnet_1c_id" {
  description = "Private DB Subnet 1c ID"
  value       = aws_subnet.private_db_1c.id
}

output "private_db_subnet_ids" {
  description = "List of Private DB Subnet IDs for RDS Subnet Group"
  value       = [aws_subnet.private_db_1a.id, aws_subnet.private_db_1c.id]
}

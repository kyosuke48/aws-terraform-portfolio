output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_ap_subnet_id" {
  value = aws_subnet.private_ap.id
}

output "private_db_subnet_id" {
   value = aws_subnet.private_db.id 
}

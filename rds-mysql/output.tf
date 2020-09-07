#Below is the exported RDS service

output "rds_sg" {
  value = aws_security_group.core_rds_security_group.id
}

output "rds_address" {
  value = aws_db_instance.core_rds_db.address
}
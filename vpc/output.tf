# Exported Output variable
output "vpcid" {
  value = aws_vpc.core_vpc.id
}

output "dbsubnet1" {
  value = aws_subnet.subnet_private_db.0.id
}

output "dbsubnet2" {
  value = aws_subnet.subnet_private_db.1.id
}

output "appsubnet1" {
  value = aws_subnet.subnet_private_app.0.id
}

output "appsubnet2" {
  value = aws_subnet.subnet_private_app.1.id
}

output "pubsubnet1" {
  value = aws_subnet.subnet_public.0.id
}

output "pubsubnet2" {
  value = aws_subnet.subnet_public.1.id
}
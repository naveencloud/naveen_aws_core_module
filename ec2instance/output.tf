#Below is the exported value

output "ec2_sg" {
  value = aws_security_group.ec2_security_group.id
}

output "ec2_publicip" {
  value = aws_instance.core_instance.public_ip
}
# Exported Output

output "lt_id" {
  value = aws_launch_template.core_launch_template.id
}

output "lt_version" {
  value = aws_launch_template.core_launch_template.latest_version
}

output "ec2_sg" {
  value = aws_security_group.core_lt_security_group.id
}
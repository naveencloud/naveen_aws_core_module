# Below resource to create EC2 SG

resource "aws_security_group" "ec2_security_group" {
  name        = "${var.ec2_name}-ec2-sg"
  description = "${var.ec2_name}-ec2-sg"
  vpc_id      = var.vpc_id
  tags = {
    Name = "${var.ec2_name}-ec2-sg"
    Environment = var.environment
    Application = var.application
  }
}

resource "aws_instance" "core_instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name =  var.key_name
  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]
  associate_public_ip_address = true
  subnet_id = var.subnetid
  tags = {
    Name = var.ec2_name
    Environment = var.environment
    Application = var.application
  }

}
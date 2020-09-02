#Below is the resource to create Launch Template without Userdata
resource "aws_launch_template" "core_launch_template" {
  name_prefix             = var.core_lt_name
  image_id                = var.core_lt_ami
  ebs_optimized           = var.ebs_optimized
  user_data               = base64encode(data.template_file.asgsignal_lt_userdata.rendered)
  iam_instance_profile {
      arn = aws_iam_instance_profile.ec2role.arn
	}
  monitoring {
    enabled = var.instance_detail_monitoring
  }
  vpc_security_group_ids  = [aws_security_group.core_lt_security_group.id]
  tag_specifications {
    resource_type = var.resource_to_tag
    tags = {
	  Name         = var.ec2_name
	  Environment  = var.environment
	}
	}
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "core_lt_security_group" {
  name        = "${var.core_lt_name}-sg"
  description = "${var.core_lt_name}-rds-sg"
  vpc_id      = var.vpc_id
  tags = {
    Name = "${var.core_lt_name}-rds-sg"
    Environment = var.environment
  }
}
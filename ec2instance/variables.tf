# Below are the list of variable for EC2 Creation resource

variable "application" {
  description = "Application"
  default = ""
}

variable "environment" {
  description = "TUI environment"
  default = ""
}

variable "ec2_name" {
  description = "EC2 Name details"
}
variable "vpc_id" {
  description = "VPC ID to create SG"
}

variable "ami_id" {
  description = "AMI ID to create EC2"
}

variable "instance_type" {
  description = "Instance Type to create"
}

variable "key_name" {
  description = "Key Name need to use to create EC2 instance"
}

variable "subnetid" {
  description = "ALB Subnet details"
  type = list
}

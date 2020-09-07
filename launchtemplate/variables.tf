# Below are the List of vairables for launch Template

variable "core_lt_name" {
  description = "Core launch configuration name"
}

variable "ec2_name" {
  description = "EC2 name tag"
}

variable "key_name" {
  description = "EC2 keypair name"
}

variable "core_lt_ami" {
  description = "Core launch configuration AMI"
}

variable "vpc_id" {
  description = "VPC ID Details"
}

variable "region" {
  description = "Region of AWS Infrastructure deployed"
}

variable "cf_StackName" {
  description = "CF Stack name to send success signal"
}

variable "cf_resource_id" {
  description = "CF Stack resource logical ID to send success signal"
}

variable "instance_detail_monitoring" {
  description = "EC2 Instance monitoring option Detail or standard"
}

variable "resource_to_tag" {
  description = "Resource to attach Tag while launching Instance/Volume"
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  default     = ""
}

variable "environment" {
  description = "Environment name i.e. DEV"
}

variable "cf_stack_name" {
  description = "CF Stack name"
}

variable "asg_name" {
  description = "ASG Name"
}

variable "asg_max_size" {
  description = "ASG MAX SIZE"
}

variable "asg_desired_capacity" {
  description = "ASG desired Size"
}

variable "asg_min_size" {
  description = "ASG Min Size"
}

variable "health_check_type" {
  description = "ASG health check type"
}

variable "health_check_grace_period" {
  description = "ASG health check grace period"
}

variable "default_cooldown" {
  description = "ASG Instance cooldown period"
}

variable "tg_arn" {
  description = "Target group ARN where EC2 instance will attach"
}

variable "termination_policies" {
  description = "ASG EC2 Instance termination policy"
}

variable "VPCZoneIdentifier1" {
  description = "Subnet Details to create EC2 instance as part of ASG., AZ1 Subnet"
}

variable "VPCZoneIdentifier2" {
  description = "Subnet Details to create EC2 instance as part of ASG., AZ2 Subnet"
}

variable "enabled_metrics" {
  description = "List of Metrics enabled in ASG"
}

variable "OnDemandAllocationStrategy" {
  description = "ON Demand Instance creation strategy"
}

variable "on_demand_base_capacity" {
  description = "MINIMUM Ondemand instance based capacity"
}

variable "launch_template_version" {
  description = "Launch Template Version"
}

variable "on_demand_percentage_above_base_capacity" {
  description = "On demand Percentage above base capacity"
}

variable "spot_max_price" {
  description = "Spot Max Price"
}

variable "spot_instance_pools" {
  description = "Spot instance pool details"
}

variable "launch_template_id" {
  description = "Launch template ID"
}

variable "spot_allocation_strategy" {
  description = "Spot Instance Allocation Strategy"
}

variable "spot_instance_type1" {
  description = "Spot instance1 type"
}
variable "spot_instance_type2" {
  description = "Spot instance2 type"
}

variable "spot_instance_type3" {
  description = "Spot instance3 type"
}
variable "spot_instance_type4" {
  description = "Spot instance4 type"
}
variable "spot_instance_type5" {
  description = "Spot instance5 type"
}

variable "ec2_name" {
  description = "ASG EC2 Instance Name"
}

variable "environment" {
  description = "Environment Tag"
}

variable "cnf_asg_resourcename" {
  description = "Cloudformation resource name"
}
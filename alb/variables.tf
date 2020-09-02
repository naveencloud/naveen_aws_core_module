# Below are the list of variable for ALB Creation resource

variable "application" {
  description = "Application"
  default = ""
}

variable "environment" {
  description = "TUI environment"
  default = ""
}

variable "alb_name" {
  description = "ALB Name details"
}
variable "vpc_id" {
  description = "VPC ID to create ALB"
}

variable "subnetid" {
  description = "ALB Subnet details"
  type = list
}

variable "application_service_port" {
  description = "Application service port runninmg in instance"
}

variable "lb_internal" {
  description = "Boolean variable to enable internal/external load balancer"
  default = ""
}

variable "idle_timeout" {
  description = "ALB Timeout for requets process"
  default = ""
}

variable "lb_tg_protocol" {
  description = "load balancer target group protocol"
  default = ""
}

variable "lb_tg_port" {
  description = "load balancer incoming service port"
  default = ""
}

variable "deregistration_delay" {
  description = "Time passed before changing the state of a deregistering target to unused"
  default = "60"
}

variable "lb_tg_hc_path" {
  description = "load balancer target group health check path"
  default = ""
}

variable "lb_tg_hc_matcher" {
  description = "load balancer target group health check matcher"
  default = ""
}

variable "lb_tg_hc_timeout" {
  description = "load balancer target group health check timeout"
  default = ""
}

variable "lb_tg_hc_interval" {
  description = "load balancer target group health check interval"
  default = ""
}

variable "lb_tg_hc_hthreshold" {
  description = "load balancer target group health check healthy threshold"
  default = ""
}

variable "lb_tg_hc_uhthreshold" {
  description = "load balancer target group health check unhealthy threshold"
  default = ""
}
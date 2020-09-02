# Below resource to create LB SG

resource "aws_security_group" "lb_security_group" {
  name        = "${var.alb_name}-alb-sg"
  description = "${var.alb_name}-alb-sg"
  vpc_id      = var.vpc_id
  tags = {
    Name = "${var.alb_name}-alb-sg"
    Environment = var.environment
    Application = var.application
  }
}

resource "aws_lb" "core_alb" {
  name = "${var.alb_name}-lb"
  internal = var.lb_internal
  subnets = var.subnetid
  security_groups = [aws_security_group.lb_security_group.0.id]
  load_balancer_type = "application"
  idle_timeout = var.idle_timeout
  tags = {
    Name = "${var.alb_name}-lb"
    Environment = var.environment
    Application = var.application
  }
}

#Resource to create Target Group

resource "aws_lb_target_group" "alb_core_tg" {
  name = "${var.alb_name}-tg"
  port = var.application_service_port
  protocol = "HTTP"
  target_type = "ip"
  deregistration_delay = var.deregistration_delay
  vpc_id = var.vpc_id

  health_check {
    port = var.application_service_port
    path = var.lb_tg_hc_path
    matcher = var.lb_tg_hc_matcher
    timeout = var.lb_tg_hc_timeout
    interval = var.lb_tg_hc_interval
    protocol = "HTTP"
    healthy_threshold = var.lb_tg_hc_hthreshold
    unhealthy_threshold = var.lb_tg_hc_uhthreshold
  }
  tags = {
    Name = "${var.alb_name}-tg"
    Environment = var.environment
    Application = var.application
  }
}

# Target Group Listner Rule
resource "aws_lb_listener" "lb_listener_rule" {
  load_balancer_arn = aws_lb.core_alb.0.arn
  port = var.lb_tg_port
  protocol = var.lb_tg_protocol
  default_action {
    target_group_arn = aws_lb_target_group.alb_core_tg.0.arn
    type = "forward"
  }
}
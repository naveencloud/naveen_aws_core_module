#Below is the exported RDS service

output "core_tg_id" {
  value = aws_lb_target_group.alb_core_tg.id
}

output "tg_arn" {
  value = aws_lb_target_group.alb_core_tg.arn
}

output "alb_sg" {
  value = aws_security_group.lb_security_group.id
}
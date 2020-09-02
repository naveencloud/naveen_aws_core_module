#Below is the exported RDS service

output "core_tg_id" {
  value = aws_lb_target_group.alb_core_tg.id
}
output "target_group_arn" {
  description = "ID del target group creado"
  value       = aws_lb_target_group.main.arn
}

output "alb_arn" {
  description = "ID del balanceador creado"
  value       = aws_lb.main.arn
}

output "aws_dns_name" {
  description = "Nombre DNS del ALB"
  value       = aws_lb.main.dns_name
}

output "aws_listener_arn" {
  description = "Listener del ALB"
  value       = aws_lb_listener.http.arn
}
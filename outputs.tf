output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.network.vpc_id
}

output "alb_security_group_id" {
  description = "ID del Security Group del ALB"
  value       = module.security.alb_security_group_id
}

output "ec2_security_group_id" {
  description = "ID del Security Group de EC2"
  value       = module.security.ec2_security_group_id
}

output "autoscaling_group_name" {
  description = "Nombre del Auto Scaling Group"
  value       = module.compute.autoscaling_group_name
}

output "launch_template_id" {
  description = "ID del Launch Template"
  value       = module.compute.launch_template_id
}

output "alb_dns_name" {
  description = "DNS público del Application Load Balancer"
  value       = module.load_balancer.aws_dns_name
}
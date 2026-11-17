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
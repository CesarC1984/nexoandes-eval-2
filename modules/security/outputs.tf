##Este output será usado para desde el modulo raiz para entregar la data necesaria al ec2 y el ALB
output "alb_security_group_id" {
  description = "ID del Security Group del ALB"
  value       = aws_security_group.alb.id
}

output "ec2_security_group_id" {
  description = "ID del Security Group de EC2"
  value       = aws_security_group.ec2.id
}
output "instance_public_ip" {
  description = "Direccion IPv4 publica de la instancia web"
  value       = aws_instance.web.public_ip
}

output "instance_public_dns" {
  description = "Nombre DNS publico de la instancia web"
  value       = aws_instance.web.public_dns
}

output "instance_id" {
  description = "Identificador de la instancia EC2"
  value       = aws_instance.web.id
}
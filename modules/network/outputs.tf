output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.main.id
}

output "subnet_a_id" {
  description = "ID de la primera subred"
  value       = aws_subnet.subnet_a.id
}

output "subnet_b_id" {
  description = "ID de la segunda subred"
  value       = aws_subnet.subnet_b.id
}

output "internet_gateway_id" {
  description = "ID del Internet Gateway"
  value       = aws_internet_gateway.gw.id
}

output "route_table_id" {
  description = "ID de la tabla de rutas pública"
  value       = aws_route_table.public.id
}

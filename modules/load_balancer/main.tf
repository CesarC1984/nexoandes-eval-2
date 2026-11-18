##parámetro "internals = false" indica que el ALB será publico de acceso publico.
##load_balancer_type = "application" paámetro indica que el ALB será de capa 7
resource "aws_lb" "main" {
  name               = "na-u2-c50-a02-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = var.subnet_ids

  tags = {
    Name      = "na-u2-c50-a02-alb"
    Proyecto  = "NexoAndes"
    Fase      = "U2"
    Alumno    = "a02"
    Curso     = "c50"
    Proveedor = "AWS"
  }
}
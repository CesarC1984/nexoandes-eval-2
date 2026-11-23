##parámetro "internals = false" indica que el ALB será de acceso publico
##load_balancer_type = "application" parámetro indica que el ALB será de capa 7
resource "aws_lb" "main" {
  name               = "na-u2-c50-a002-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = var.subnet_ids

  tags = {
    Name      = "na-u2-c50-a002-alb"
    Proyecto  = "NexoAndes"
    Fase      = "U2"
    Alumno    = "a002"
    Curso     = "c50"
    Proveedor = "AWS"
  }
}

#Crea el target group 'main' y establece los intervalos de health check.
#matcher, indica si la respuesta es "200" se considera OK.
resource "aws_lb_target_group" "main" {
  name        = "na-u2-c50-a002-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    enabled             = true
    path                = "/health"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 3
  }

  tags = {
    Name      = "na-u2-c50-a002-tg"
    Proyecto  = "NexoAndes"
    Fase      = "U2"
    Alumno    = "a002"
    Curso     = "c50"
    Proveedor = "AWS"
  }
}

#Crea e listener que escuchará por puerto 80
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}
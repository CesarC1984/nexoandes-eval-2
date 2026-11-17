##Crea el recurso Security Group, destino el ALB
resource "aws_security_group" "alb" {
  name        = "na-u2-c50-a02-sg-alb"
  description = "Security Group para el Application Load Balancer"
  vpc_id      = var.vpc_id


  ##Crea la regla de ingreso que permite el trafico HTTP en puerto 80 en el ALB
  ingress {
    description = "HTTP desde Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ##La regla inversa, hacia el exterior.
  egress {
    description = "Trafico hacia las instancias EC2"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "na-u2-c50-a02-sg-alb"
    Proyecto  = "NexoAndes"
    Fase      = "U2"
    Alumno    = "a02"
    Curso     = "c50"
    Proveedor = "AWS"
  }
}


## Security Group destinado a las instancias EC2
resource "aws_security_group" "ec2" {
  name        = "na-u2-c50-a02-sg-ec2"
  description = "Security Group para las instancias EC2"
  vpc_id      = var.vpc_id

  tags = {
    Name      = "na-u2-c50-a02-sg-ec2"
    Proyecto  = "NexoAndes"
    Fase      = "U2"
    Alumno    = "a02"
    Curso     = "c50"
    Proveedor = "AWS"
  }
}
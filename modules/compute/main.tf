# Data no establece una AMI, solo consulta por disponibilidad
# de acuerdo con criterios establecidos en la configuración.

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_launch_template" "main" {
  name                   = "na-u2-c50-a02-lt"
  image_id               = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [var.ec2_security_group_id]

  user_data = base64encode(
    templatefile("${path.module}/../../scripts/user_data_u2.sh.tpl", {
      provider       = "aws"
      x              = 2
      student        = "a002"
      course         = "c50"
      build_ref      = "edbed51"
      portal_version = "v1"
    })
  )

  tags = {
    Name      = "na-u2-c50-a02-lt"
    Proyecto  = "NexoAndes"
    Fase      = "U2"
    Alumno    = "a002"
    Curso     = "c50"
    Proveedor = "AWS"
  }


  tag_specifications {
    resource_type = "instance"

    tags = {
      Name      = "na-u2-c50-a02-ec2"
      Proyecto  = "NexoAndes"
      Fase      = "U2"
      Alumno    = "a002"
      Curso     = "c50"
      Proveedor = "AWS"
    }
  }
}

# Nombre y capacidad del Auto Scaling Group
resource "aws_autoscaling_group" "main" {
  name             = "na-u2-c50-a02-asg"
  min_size         = 2
  max_size         = 4
  desired_capacity = 2

  # Subnets en las que se desplegará el ASG
  vpc_zone_identifier = [
    var.subnet_a_id,
    var.subnet_b_id
  ]

  # Utiliza el Launch Template
  launch_template {
    id      = aws_launch_template.main.id
    version = aws_launch_template.main.latest_version
  }

  #Rolling, reemplaza instancias progresivamente en vez de deternerlas de golpe
  instance_refresh {
    strategy = "Rolling"

    preferences {
      min_healthy_percentage = 100
      max_healthy_percentage = 200
      instance_warmup        = 180
    }
  }

  # Registra las instancias automáticamente en el Target Group
  target_group_arns = [var.target_group_arn]

  health_check_type         = "ELB"
  health_check_grace_period = 180

  # Tags del ASG
  tag {
    key                 = "Name"
    value               = "na-u2-c50-a02-ec2"
    propagate_at_launch = true
  }

  tag {
    key                 = "Proyecto"
    value               = "NexoAndes"
    propagate_at_launch = true
  }

  tag {
    key                 = "Fase"
    value               = "U2"
    propagate_at_launch = true
  }

  tag {
    key                 = "Alumno"
    value               = "a002"
    propagate_at_launch = true
  }

  tag {
    key                 = "Curso"
    value               = "c50"
    propagate_at_launch = true
  }

  tag {
    key                 = "Proveedor"
    value               = "AWS"
    propagate_at_launch = true
  }
}
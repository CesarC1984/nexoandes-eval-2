variable "vpc_id" {
  description = "ID de la VPC donde se creará el Target Group"
  type        = string
}

variable "subnet_ids" {
  description = "IDs de las subredes públicas del ALB"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "ID del Security Group asociado al ALB"
  type        = string
}
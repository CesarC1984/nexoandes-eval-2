variable "vpc_cidr" {
  description = "Bloque CIDR de la VPC"
  type        = string
}

variable "subnet_a_cidr" {
  description = "Bloque CIDR de la primera subred"
  type        = string
}

variable "subnet_b_cidr" {
  description = "Bloque CIDR de la segunda subred"
  type        = string
}

variable "availability_zones" {
  description = "Zonas de disponibilidad para las subredes"
  type        = list(string)

  validation {
    condition     = length(var.availability_zones) == 2 && length(distinct(var.availability_zones)) == 2
    error_message = "Se deben proporcionar exactamente dos zonas de disponibilidad distintas."
  }
}
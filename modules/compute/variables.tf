variable "subnet_a_id" {
  description = "ID de la subnet a usar para compute"
  type        = string
}

variable "subnet_b_id" {
  description = "ID de la subnet a usar para compute"
  type        = string
}

variable "ec2_security_group_id" {
  description = "ID de Security Group"
  type        = string
}

variable "target_group_arn" {
  description = "ARN Target Group al que se asociarán las instancias"
  type        = string
}
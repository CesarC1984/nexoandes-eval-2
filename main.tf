module "network" {
  source = "./modules/network"

  vpc_cidr           = var.vpc_cidr
  subnet_a_cidr      = var.subnet_a_cidr
  subnet_b_cidr      = var.subnet_b_cidr
  availability_zones = var.availability_zones
}
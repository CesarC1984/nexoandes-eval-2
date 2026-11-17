module "network" {
  source = "./modules/network"

  vpc_cidr           = var.vpc_cidr
  subnet_a_cidr      = var.subnet_a_cidr
  subnet_b_cidr      = var.subnet_b_cidr
  availability_zones = var.availability_zones
}

module "security" {
  source = "./modules/security"

  vpc_id = module.network.vpc_id
}
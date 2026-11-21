module "network" {
  source             = "./modules/network"
  vpc_cidr           = var.vpc_cidr
  subnet_a_cidr      = var.subnet_a_cidr
  subnet_b_cidr      = var.subnet_b_cidr
  availability_zones = var.availability_zones
}

module "security" {
  source = "./modules/security"
  vpc_id = module.network.vpc_id
}

module "load_balancer" {
  source = "./modules/load_balancer"
  subnet_ids = [
    module.network.subnet_a_id,
    module.network.subnet_b_id
  ]
  vpc_id                = module.network.vpc_id
  alb_security_group_id = module.security.alb_security_group_id
}

module "compute" {
  source = "./modules/compute"

  subnet_a_id           = module.network.subnet_a_id
  subnet_b_id           = module.network.subnet_b_id
  ec2_security_group_id = module.security.ec2_security_group_id
  target_group_arn      = module.load_balancer.target_group_arn
}
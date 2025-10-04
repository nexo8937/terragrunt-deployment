module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name               = var.name
  cidr               = var.cidr
  azs                = var.azs
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  database_subnets   = var.database_subnets
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  manage_default_network_acl         = false
  manage_default_security_group      = false
  manage_default_route_table         = false
  create_elasticache_subnet_group    = false
  create_redshift_subnet_group       = false
  create_database_subnet_group       = false
  create_database_subnet_route_table = true
  tags = {
    Owner = var.owner
  }
}

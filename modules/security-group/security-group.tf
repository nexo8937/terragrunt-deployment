#module "vote_service_sg" {
#  source = "terraform-aws-modules/security-group/aws"
#
#  name        = "user-service"
#  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
#  vpc_id      = "vpc-12345678"
#
#  ingress_cidr_blocks      = ["10.10.0.0/16"]
#  ingress_rules            = ["https-443-tcp"]
#  ingress_with_cidr_blocks = [
#    {
#      from_port   = 8080
#      to_port     = 8090
#      protocol    = "tcp"
#      description = "User-service ports"
#      cidr_blocks = "10.10.0.0/16"
#    },
#    {
#      rule        = "postgresql-tcp"
#      cidr_blocks = "0.0.0.0/0"
#    },
#  ]
#}

module "db_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.2.0"

  name = var.name
  #  description = "Security group for DB instance with 5432 ports open within VPC"
  vpc_id = var.vpc_id

  ingress_with_cidr_blocks = [
    {
      #      from_port = 5432
      #      to_port   = 5432
      from_port = var.port
      to_port   = var.port
      protocol  = "tcp"
      #      cidr_blocks = "10.0.0.0/16"
      cidr_blocks = var.cidr_blocks
      description = "Allow PostgreSQL from internal network"
    }
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0" # <- list
      description = "Allow all outbound"
    }
  ]
}

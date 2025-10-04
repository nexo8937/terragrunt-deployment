module "db_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.2.0"

  name   = var.name
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
  tags = {
    Owner = var.owner
  }
}

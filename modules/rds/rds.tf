#module "rds" {
#  source  = "terraform-aws-modules/rds/aws"
#  version = "6.12.0"
#
#  identifier     = "terragrunt-test"
#  engine         = "postgres"
#  engine_version = "15.3"
#
#  instance_class    = "db.t3.micro"
#  allocated_storage = 20
#  db_name           = "test"
#  username          = "admin"
#  password          = "SuperSecret123!"
#
#  vpc_security_group_ids = [aws_security_group.db_sg.id]
#  db_subnet_group_name   = aws_db_subnet_group.default.name
#
#  publicly_accessible = false
#  skip_final_snapshot = true
#}
#
#
################################################################
#
#module "security-group" {
#  source  = "terraform-aws-modules/security-group/aws"
#  version = "5.3.0"
#
#  name        = "db-sg"
#  description = "Security group for PostgreSQL"
#  vpc_id      = var.vpc_id
#
#  # Define rules
#  rules = {
#    postgresql-tcp = [5432, 5432, "tcp", "PostgreSQL access from VPC"]
#  }
#
#  # Map rules to allowed CIDRs
#  ingress_with_cidr_blocks = {
#    postgresql-tcp = [var.vpc_cidr]
#  }
#
#  egress_with_cidr_blocks = {
#    all-all = ["0.0.0.0/0"] # allow all outbound traffic
#  }
#}
#

#terraform {
#  source = "tfr://registry.terraform.io/terraform-aws-modules/rds/aws?version=6.12.0"
#}
##terraform {
##  source = "${get_repo_root()}/modules/rds"
##}
#
#include {
#  path = find_in_parent_folders()
#}
#
## Pull VPC outputs from dev/network
##dependency "network" {
##  config_path = "../network"
##}
#
#inputs = {
#  identifier = "terragrunt-test"
#  db_name     = "test"
#  username = "test"
#  password = "00000000"
#  db_name = "test"
#  engine   = "postgres"
#  instance_class     = "db.t3.micro"
#  skip_final_snapshot = true
#  allocated_storage = 5
#  create_db_subnet_group = true
#  create_db_parameter_group = false
#  db_subnet_group_name  = "terragrunt-test"
#  vpc_security_group_ids = ["sg-03bea78042a6d0b91"]
#  vpc_id             = "vpc-0af01a0c2abf9e0fb"
#  subnet_ids =  ["subnet-0b2e3c682b3a72ce8", "subnet-022a92d4d7c7790da"]
##  vpc_id             = dependency.network.outputs.vpc_id
##  subnet_ids = dependency.network.outputs.database_subnets
#}


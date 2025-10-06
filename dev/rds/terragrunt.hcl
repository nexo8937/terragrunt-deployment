terraform {
  source = "${get_repo_root()}/modules/rds"
}

include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path  = "../network"
  mock_outputs        = {
    database_subnets = "database_subnets"
    }
}

dependency "security_group" {
  config_path  = "../security-group"
  mock_outputs        = {
    security_group_id = "security_group_id"
    }
}

inputs = {
  identifier = "terragrunt-test"
#  db_name     = "test"
  username = "test"
  password = "00000000"
  db_name = "test"
  engine   = "postgres"
  instance_class     = "db.t3.micro"
  skip_final_snapshot = true
  allocated_storage = 5
  create_db_subnet_group = true
  create_db_parameter_group = false
  db_subnet_group_name  = "terragrunt-test"
  vpc_security_group_ids = [dependency.security_group.outputs.security_group_id]
  subnet_ids = dependency.vpc.outputs.database_subnets
  manage_master_user_password = false
  publicly_accessible = false
  owner = "Yeghish"
}


terraform {
  source = "${get_repo_root()}/modules/security-group"
}

include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../network"
}

inputs = {
  name        = "db-sg"
  vpc_id      = dependency.vpc.outputs.vpc_id 
  port        = 5432
  cidr_blocks = "10.0.0.0/16"
}  
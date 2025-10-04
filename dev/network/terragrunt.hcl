include "root" {
    path = find_in_parent_folders()
}

terraform {
  source = "${get_repo_root()}/modules/vpc"
}

inputs = {
  name = "terragrunt-test"
  azs  = ["eu-west-1a", "eu-west-1b"]
  cidr = "10.0.0.0/16"
  public_subnets  = ["10.0.11.0/24", "10.0.12.0/24"]
  private_subnets = ["10.0.21.0/24", "10.0.22.0/24"]
  database_subnets = ["10.0.31.0/24", "10.0.32.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
  owner = "Yeghish"
}
include "root" {
    path = find_in_parent_folders()
}

terraform {
  source = "${get_repo_root()}/modules/eks"
}

dependency "vpc" {
  config_path  = "../network"
  mock_outputs        = {
    vpc_id = "vpc_id"
    private_subnets = ["subnet-123", "subnet-456"]
    }
}


inputs = {
  name = "terragrunt-test"
  kubernetes_version = "1.33"
  endpoint_public_access = true
  vpc_id = dependency.vpc.outputs.vpc_id
  ami_type = "AL2023_x86_64_STANDARD"
  desired_size = 1
  max_size = 2
  min_size =1
  subnet_ids = dependency.vpc.outputs.private_subnets
  instance_types =   ["t3.small"]
  owner     = "Yeghish"
}
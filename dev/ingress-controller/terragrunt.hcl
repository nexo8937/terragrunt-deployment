terraform {
  source = "${get_repo_root()}/modules/ingress-controller"
}

include {
  path = find_in_parent_folders()
}

dependency "eks" {
  config_path  = "../eks"
  mock_outputs        = {
    cluster_endpoint = "cluster_endpoint"
    cluster_certificate_authority_data = "cluster_certificate_authority_data"
    cluster_name = "cluster_name"
    }
}

inputs = {
  cluster_endpoint       = dependency.eks.outputs.cluster_endpoint
  cluster_certificate_authority_data = dependency.eks.outputs.cluster_certificate_authority_data
  cluster_name           = dependency.eks.outputs.cluster_name
}
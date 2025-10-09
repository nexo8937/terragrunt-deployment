provider "helm" {
  kubernetes = {
    host                   = var.cluster_endpoint
    cluster_ca_certificate = base64decode(var.cluster_certificate_authority_data)
    #    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    exec = {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
      command     = "aws"
    }
  }
}

module "application" {
  source           = "github.com/nexo8937/terraform-modules//helm"
  container_name   = var.container_name
  container_image  = var.container_image
  replica_count    = var.replica_count
  release_name     = var.release_name
  helm_chart_path  = var.helm_chart_path
  values_file_path = var.values_file_path
}

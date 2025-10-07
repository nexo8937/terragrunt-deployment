#module "eks" {
#  source = "github.com/nexo8937/terraform-modules//eks"
#  app    = "Hotel-Management"
#  #EKS
#  cluster_version = "1.29"
#  public_subnets  = data.terraform_remote_state.backend.outputs.public_subnets
#  private_subnets = data.terraform_remote_state.backend.outputs.private_subnets
#  #NODEGROUP
#  instance_type = "t3.small"
#  desired_size  = "1"
#  max_size      = "2"
#  min_size      = "1"
#  env           = "dev"
#}
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = var.name
  kubernetes_version = var.kubernetes_version

  addons = {
    coredns = {}
    #    eks-pod-identity-agent = {
    #      before_compute = true
    #    }
    kube-proxy = {}
    vpc-cni = {
      before_compute = true
    }
  }

  # Optional
  endpoint_public_access = var.endpoint_public_access

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids
  #  control_plane_subnet_ids = ["subnet-xyzde987", "subnet-slkjf456", "subnet-qeiru789"]

  # EKS Managed Node Group(s)
  eks_managed_node_groups = {
    example = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      ami_type = var.ami_type

      #      instance_types = ["t3.small"]
      instance_types = var.instance_types

      min_size     = var.min_size
      max_size     = var.max_size
      desired_size = var.desired_size
    }
  }

  tags = {
    Owner = var.owner
  }
}

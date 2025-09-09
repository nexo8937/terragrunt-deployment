variable "repo_name" {}

module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "3.0.1"

  repository_name = var.repo_name

  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep last 30 images",
        selection = {
          tagStatus     = "tagged",
          tagPrefixList = ["v"],
          countType     = "imageCountMoreThan",
          countNumber   = 30
        },
        action = {
          type = "expire"
        }
      }
    ]
  })
}

# backend.tf file with remote state configuration
remote_state {
  backend = "s3"
  generate = {
    path      = "_backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket         = "brainscale-terragrunt-tfstate-test"
    key            = "terragrunt/${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "terragrunt-lock-test"
  }
}

# config.tf with provider configuration
generate "my_config" {
  path = "config.tf"
  if_exists = "overwrite"

  contents = <<EOF
provider "aws" {
  region = "eu-west-1"
 }
EOF
}

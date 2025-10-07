variable "name" {}

variable "kubernetes_version" {}

variable "endpoint_public_access" {
  type = bool
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "ami_type" {}

variable "desired_size" {}
variable "max_size" {}
variable "min_size" {}
variable "owner" {}

variable "instance_types" {}

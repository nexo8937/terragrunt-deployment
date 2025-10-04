variable "name" {
  type        = string
  description = "Name of the security group"
  #  default     = "db-sg"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where SG will be created"
  #  default     = "vpc-0af01a0c2abf9e0fb"
}

variable "port" {
  type = number
  #  description = "Port to allow for ingress"
  #  default     = 5432
}

variable "cidr_blocks" {
  type = string
  #  description = "CIDR blocks allowed for ingress"
  #  default     = ["10.0.0.0/16"]
}

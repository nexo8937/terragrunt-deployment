
output "security_group_id" {
  description = "The ID of the VPC"
  value       = module.db_sg.security_group_id
}

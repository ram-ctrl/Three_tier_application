# Database Outputs
output "database_endpoint" {
  description = "The endpoint of the RDS database"
  value       = aws_db_instance.db_instance.endpoint
}

output "database_username" {
  description = "The master username for the database"
  value       = aws_db_instance.db_instance.username
  sensitive   = true
}

output "database_port" {
  description = "The port on which the database is listening"
  value       = aws_db_instance.db_instance.port
}

output "database_security_group_id" {
  description = "The security group ID assigned to the database"
  value       = aws_security_group.db_sg.id
}

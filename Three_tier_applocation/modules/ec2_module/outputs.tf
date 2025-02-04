# Frontend EC2 Instance Outputs
output "frontend_instance_id" {
  description = "The ID of the frontend EC2 instance"
  value       = aws_instance.frontend.id
}

output "frontend_public_ip" {
  description = "The public IP address of the frontend EC2 instance"
  value       = aws_instance.frontend.public_ip
}

output "frontend_private_ip" {
  description = "The private IP address of the frontend EC2 instance"
  value       = aws_instance.frontend.private_ip
}

# Backend EC2 Instance Outputs
output "backend_instance_id" {
  description = "The ID of the backend EC2 instance"
  value       = aws_instance.backend.id
}

output "backend_private_ip" {
  description = "The private IP address of the backend EC2 instance"
  value       = aws_instance.backend.private_ip
}

# Security Groups
output "frontend_security_group_id" {
  description = "The security group ID assigned to the frontend instance"
  value       = aws_security_group.frontend_sg.id
}

output "backend_security_group_id" {
  description = "The security group ID assigned to the backend instance"
  value       = aws_security_group.backend_sg.id
}

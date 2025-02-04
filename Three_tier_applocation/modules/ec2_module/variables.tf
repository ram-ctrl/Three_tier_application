# EC2 Instance Type
variable "instance_type" {
  description = "EC2 instance type to use"
  type        = string
  default     = "t2.micro"
}

# Subnet IDs for EC2 Instances
variable "public_subnet_id" {
  description = "The Public Subnet ID where the frontend EC2 instance will be deployed"
  type        = string
}

variable "private_subnet_id" {
  description = "The Private Subnet ID where the backend EC2 instance will be deployed"
  type        = string
}

# AMI IDs for EC2 Instances
variable "frontend_ami" {
  description = "AMI ID for the frontend EC2 instance"
  type        = string
}

variable "backend_ami" {
  description = "AMI ID for the backend EC2 instance"
  type        = string
}

# Security Group IDs for EC2 Instances
variable "frontend_sg_id" {
  description = "Security Group ID for the frontend instance"
  type        = string
}

variable "backend_sg_id" {
  description = "Security Group ID for the backend instance"
  type        = string
}

# GitHub Repositories for Frontend and Backend
variable "frontend_repo_url" {
  description = "GitHub repository URL for the frontend application"
  type        = string
  default     = "https://github.com/facebook/create-react-app.git"
}

variable "backend_repo_url" {
  description = "GitHub repository URL for the backend application"
  type        = string
  default     = "https://github.com/typicode/json-server.git"
}

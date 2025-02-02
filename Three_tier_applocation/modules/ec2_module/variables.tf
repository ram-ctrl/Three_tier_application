variable "project_name" {
  description = "Project name for tagging resources"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type to use"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "The Subnet ID where the EC2 instances will be deployed"
  type        = string
}

variable "frontend_ami" {
  description = "AMI ID for the frontend EC2 instance"
  type        = string
}

variable "backend_ami" {
  description = "AMI ID for the backend EC2 instance"
  type        = string
}

variable "frontend_sg_id" {
  description = "Security Group ID for the frontend instance"
  type        = string
}

variable "backend_sg_id" {
  description = "Security Group ID for the backend instance"
  type        = string
}

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

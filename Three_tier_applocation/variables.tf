# VPC Configuration
variable "application_name" {
  description = "Application name for tagging the resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for subnet"
  type        = string
}

# EC2 Instance Configuration
variable "instance_type" {
  description = "EC2 instance type to use"
  type        = string
  default     = "t2.micro"
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
}

variable "backend_repo_url" {
  description = "GitHub repository URL for the backend application"
  type        = string
}

# Database Configuration (RDS)
variable "db_instance_identifier" {
  description = "Identifier for the RDS instance"
  type        = string
}

variable "engine" {
  description = "Database engine to use"
  type        = string
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "allocated_storage" {
  description = "Storage allocated for the RDS instance"
  type        = number
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password_secret_id" {
  description = "The Secret ID in AWS Secrets Manager for the database password"
  type        = string
}

variable "parameter_group_name" {
  description = "Parameter group name for the RDS instance"
  type        = string
}

variable "db_sg_ids" {
  description = "Security group IDs for the RDS instance"
  type        = list(string)
}

variable "db_subnet_group_name" {
  description = "Subnet group name for the RDS instance"
  type        = string
}

# IAM Configuration
variable "codedeploy_role_name" {
  description = "IAM role for AWS CodeDeploy"
  type        = string
}

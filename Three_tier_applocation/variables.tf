variable "application_name" {
  description = "application name for tagging the resources"
  type = string
}

# A CIDR block (Classless Inter-Domain Routing block) it  specifies a range of IP addresses. 
# It is commonly used to define the network address space for resources like a VPC 
variable "vpc_cidr" {
  description = "CIDR block for vpc"
  type = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for subnet"
  type = string
  
}
variable "availability_zone" {
  description = "Availability zone for subnet"
  type = string
  
}

variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type to use"
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
}

variable "backend_repo_url" {
  description = "GitHub repository URL for the backend application"
  type        = string
}

# RDS Module Variables

variable "db_instance_identifier" {
  description = "Identifier for the RDS instance"
  type        = string
}

variable "engine" {
  description = "The database engine to use (e.g., postgres, mysql)"
  type        = string
}

variable "engine_version" {
  description = "The engine version to use"
  type        = string
}

variable "instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
}

variable "allocated_storage" {
  description = "The allocated storage (in GB) for the RDS instance"
  type        = number
}

variable "db_name" {
  description = "Name of the database to create"
  type        = string
}

variable "db_username" {
  description = "The master username for the database"
  type        = string
}

variable "db_password_secret_id" {
  description = "The AWS Secrets Manager secret ID containing the database password"
  type        = string
}

variable "parameter_group_name" {
  description = "The DB parameter group name"
  type        = string
}

variable "db_sg_ids" {
  description = "A list of security group IDs for the RDS instance"
  type        = list(string)
}

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group"
  type        = string
}


# IAM Module Variables

variable "codedeploy_role_name" {
  description = "Prefix for the IAM role for CodeDeploy. Terraform will generate a unique name starting with this prefix."
  type        = string
}
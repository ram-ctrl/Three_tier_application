# Application Name for tagging resources
variable "application_name" {
  description = "Application name for tagging the resources"
  type        = string
}

# CIDR Block for VPC
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

# CIDR Block for Public Subnet
variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

# CIDR Block for Private Subnet
variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
}

# Availability Zone for the Subnets
variable "availability_zone" {
  description = "Availability zone for subnet"
  type        = string
}

# Project Name for tagging resources
variable "project_name" {
  description = "Project name for tagging resources"
  type        = string
}

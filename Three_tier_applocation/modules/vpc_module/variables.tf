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
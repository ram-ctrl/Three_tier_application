//creating vpc(virtual private cloud network)
//tag is expects  string interpolation
//aws_vpc terraform resource type and my_vpc terraform resource name
//my_vpc you can change according the way u want
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name="${var.application_name}-vpc"
  }
}

//creating public subnet
//A public subnet is needed when instances (EC2, Load Balancers, etc.) must be directly accessible from the internet.
//map_public_ip_on_launch = true ensures that instances launched in this subnet get a public IP
resource "aws_subnet" "public" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.public_subnet_cidr
  availability_zone = var.availability_zone
  map_customer_owned_ip_on_launch = true
  tags={
    Name="${var.application_name}-public-subnet"
  }
 }

 //create a private subnet
 //A private subnet is needed when instances should not be directly accessible from the internet for security reasons.
 //Typically used for internal applications and databases.
 resource "aws_subnet" "private" {
   vpc_id = aws_vpc.my_vpc.id
   cidr_block = var.private_subnet_cidr
   availability_zone = var.availability_zone
   tags={
    Name="${var.application_name}-private-subnet"
   }
 }

//
//internet Gateway (IGW) is a component that allows traffic to flow between AWS and the internet.
// Without an IGW, instances cannot access or be accessed from the internet.
//Works at the VPC level
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags={
    Name="${var.application_name}-igw"
  }
}

//create a route table for the public subnet
//and add default route through the Internet Gateway
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id
  route = {
    cidr_block="0.0.0.0/0"
    gateway_id=aws_internet_gateway
  }
}

//Associate the public subnet with public routing table
resource "aws_route_table_association" "public_association" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
  
}
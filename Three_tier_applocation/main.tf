// Call the VPC Module
module "vpc" {
  source              = "./modules/vpc_module"
  application_name    = var.application_name
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
}

// Call the EC2 Module, using the public subnet from the VPC module
module "ec2" {
  source             = "./modules/ec2_module"
  project_name       = var.application_name
  instance_type      = var.instance_type
  subnet_id          = module.vpc.public_subnet_id
  frontend_ami       = var.frontend_ami
  backend_ami        = var.backend_ami
  frontend_sg_id     = var.frontend_sg_id
  backend_sg_id      = var.backend_sg_id
  frontend_repo_url  = var.frontend_repo_url
  backend_repo_url   = var.backend_repo_url
}
// Call the RDS Module
module "rds" {
  source                   = "./modules/rds_module"
  db_instance_identifier   = var.db_instance_identifier
  engine                   = var.engine
  engine_version           = var.engine_version
  instance_class           = var.instance_class
  allocated_storage        = var.allocated_storage
  db_name                  = var.db_name
  db_username              = var.db_username
  db_password_secret_id    = var.db_password_secret_id
  parameter_group_name     = var.parameter_group_name
  db_sg_ids                = var.db_sg_ids
  db_subnet_group_name     = var.db_subnet_group_name
}

// Call the IAM Module
module "iam" {
  source               = "./modules/iam_module"
  codedeploy_role_name = var.codedeploy_role_name
}

# RDS Module

This module provisions an RDS database instance using AWS RDS. The database password is securely retrieved from AWS Secrets Manager.

## Usage Example

```hcl
module "rds" {
  source                   = "./modules/rds_module"
  db_instance_identifier   = "mydb-instance"
  engine                   = "postgres"
  engine_version           = "12.4"
  instance_class           = "db.t3.micro"
  allocated_storage        = 20
  db_name                  = "mydatabase"
  db_username              = "admin"
  db_password_secret_id    = "my-db-password-secret"  # The secret stored in AWS Secrets Manager
  parameter_group_name     = "default.postgres"
  db_sg_ids                = ["sg-0xxxxxxx"]
  db_subnet_group_name     = "my-db-subnet-group"
}

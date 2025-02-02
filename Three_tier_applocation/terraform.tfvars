application_name = "my-three-tier-app"
vpc_cidr = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"
availability_zone = "us-east-1"

instance_type        = "t2.micro"

# Example Amazon Linux 2 AMI in us-east-1:
frontend_ami         = "ami-0c94855ba95c71c99"
backend_ami          = "ami-0c94855ba95c71c99"

# Replace with your actual security group IDs created for your environment
frontend_sg_id       = "sg-0xxxxxxx"
backend_sg_id        = "sg-0yyyyyyy"

frontend_repo_url    = "https://github.com/facebook/create-react-app.git"
backend_repo_url     = "https://github.com/typicode/json-server.git"

# RDS Module Values
db_instance_identifier = "mydb-instance"
engine                 = "postgres"
engine_version         = "12.4"
instance_class         = "db.t3.micro"
allocated_storage      = 20
db_name                = "mydatabase"
db_username            = "admin"
db_password_secret_id  = "my-db-password-secret"   # The secret stored in AWS Secrets Manager
parameter_group_name   = "default.postgres"
db_sg_ids              = ["sg-0123456789abcdef0"]   # Replace with your actual security group IDs
db_subnet_group_name   = "my-db-subnet-group"       # This subnet group should exist in your environment

# IAM Module Value
codedeploy_role_name   = "my-codedeploy-role"
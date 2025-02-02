provider "aws" {
  region = "us-east-1"
  access_key = data.aws_secretsmanager_secret_version.aws_creds.secret_string["AWS_ACCESS_KEY_ID"]
  secret_key = data.aws_secretsmanager_secret_version.aws_creds.secret_string["AWS_SECRET_ACCESS_KEY"]
}
data "aws_secretsmanager_secret" "aws_creds" {
  name = "my-aws-credentials" # Replace with your actual secret name
}

data "aws_secretsmanager_secret_version" "aws_creds" {
  secret_id = data.aws_secretsmanager_secret.aws_creds.id
}
terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "terraform/3tier-app.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}


# Retrieve the DB password securely from AWS Secrets Manager.
data "aws_secretsmanager_secret_version" "db_password" {
  secret_id = var.db_password_secret_id
}

resource "aws_db_instance" "db_instance" {
  identifier              = var.db_instance_identifier
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage

  # The "name" attribute creates the initial database in the instance.
  # (Note: This attribute is supported for non-Aurora engines.)
  name=var.db_name

  username                = var.db_username
  password                = data.aws_secretsmanager_secret_version.db_password.secret_string
  parameter_group_name    = var.parameter_group_name
  skip_final_snapshot     = true

  vpc_security_group_ids  = var.db_sg_ids
  db_subnet_group_name    = var.db_subnet_group_name

  tags = {
    Name = var.db_instance_identifier
  }
}

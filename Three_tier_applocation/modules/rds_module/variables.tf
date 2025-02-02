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
  default     = "default.${var.engine}"
}

variable "db_sg_ids" {
  description = "A list of security group IDs for the RDS instance"
  type        = list(string)
}

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group"
  type        = string
}

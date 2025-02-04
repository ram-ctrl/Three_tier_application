# Database Configuration Variables
variable "db_instance_identifier" {
  description = "Identifier for the RDS instance"
  type        = string
}

variable "engine" {
  description = "The database engine to use (e.g., mysql, postgres)"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "The version of the database engine"
  type        = string
  default     = "8.0"
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "The amount of storage (in gigabytes) to allocate for the RDS instance"
  type        = number
  default     = 20
}

variable "db_name" {
  description = "The name of the database to create"
  type        = string
}

variable "db_username" {
  description = "The master username for the database"
  type        = string
}

variable "db_password_secret_id" {
  description = "The Secret Manager secret ID where the DB password is stored"
  type        = string
}

variable "parameter_group_name" {
  description = "The DB parameter group to associate with the instance"
  type        = string
  default     = "default.mysql8.0"
}

variable "db_sg_ids" {
  description = "List of security group IDs to associate with the RDS instance"
  type        = list(string)
}

variable "db_subnet_group_name" {
  description = "The DB subnet group name to use for the RDS instance"
  type        = string
}

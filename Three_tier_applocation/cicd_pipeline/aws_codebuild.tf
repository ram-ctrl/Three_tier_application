resource "aws_codebuild_project" "codebuild_project" {
  name          = "my-app-build"
  service_role  = aws_iam_role.codebuild_role.arn

  artifacts {
    type     = "S3"
    location = aws_s3_bucket.artifact_bucket.bucket
  }

  source {
    type      = "CODECOMMIT"
    location  = "https://git-codecommit.us-east-1.amazonaws.com/v1/repos/${var.git_repo_name}"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/standard:5.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true

    environment_variable {
      name  = "DB_HOST"
      value = module.rds.db_instance_endpoint  # Get DB Endpoint from RDS module
    }

    environment_variable {
      name  = "DB_NAME"
      value = var.db_name
    }

    environment_variable {
      name  = "DB_USER"
      value = var.db_username
    }

    environment_variable {
      name  = "DB_PASSWORD"
      value = data.aws_secretsmanager_secret_version.db_password.secret_string
      type  = "SECRETS_MANAGER"  # Securely fetch from AWS Secrets Manager
    }
  }
}

# IAM Module

#This module creates an IAM role and policy for CodeDeploy. The role is assumed by the CodeDeploy service to perform deployments.

## Usage Example


# module "iam" {
#   source               = "./modules/iam_module"
#   codedeploy_role_name = "my-codedeploy-role"
# }

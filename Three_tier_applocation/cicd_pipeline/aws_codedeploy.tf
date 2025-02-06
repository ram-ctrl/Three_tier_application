# codedeploy.tf or in your codedeploy module

# CodeDeploy Application Resource
resource "aws_codedeploy_app" "my_app" {
  name = "my-app"
  compute_platform = "Server"  # EC2 instances as deployment target
}

# CodeDeploy Deployment Group Resource
resource "aws_codedeploy_deployment_group" "my_app_deployment_group" {
  app_name              = aws_codedeploy_app.my_app.name
  deployment_group_name = "my-app-deployment-group"
  deployment_config_name = "CodeDeployDefault.OneAtATime"  # Or another configuration
  
  ec2_tag_set {
    ec2_tag_filter {
      key    = "Name"
      value  = "my-ec2-instance"
      type   = "KEY_AND_VALUE"
    }
  }

  service_role_arn = aws_iam_role.codedeploy_role.arn
}

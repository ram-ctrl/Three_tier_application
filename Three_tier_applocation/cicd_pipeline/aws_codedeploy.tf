resource "aws_codedeploy_app" "my_app" {
  name = "my-app"
}

resource "aws_codedeploy_deployment_group" "my_app_deployment_group" {
  app_name              = aws_codedeploy_app.my_app.name
  deployment_group_name = "my-app-deployment-group"
  service_role_arn      = aws_iam_role.codedeploy_role.arn

  deployment_config_name = "CodeDeployDefault.OneAtATime"

  ec2_tag_filter {
    key   = "Name"
    value = "MyAppInstance"
    type  = "KEY_AND_VALUE"
  }
}

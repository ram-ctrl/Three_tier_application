resource "aws_codebuild_project" "codebuild_project" {
  name          = "my-app-build"
  service_role  = aws_iam_role.codebuild_role.arn
  artifacts {
    type = "S3"
    location = aws_s3_bucket.artifact_bucket.bucket
  }
  source {
    type      = "CODECOMMIT"
    location  = "https://git-codecommit.us-east-1.amazonaws.com/v1/repos/${var.git_repo_name}"
  }
  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"
    privileged_mode             = true
  }
}

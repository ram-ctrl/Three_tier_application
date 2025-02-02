#This file creates a CodePipeline that pulls source code from GitHub, triggers two CodeBuild projects (frontend and backend), 
#and then deploys via CodeDeploy.
resource "aws_codepipeline" "ci_cd_pipeline" {
  name     = "my-app-pipeline"
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = aws_s3_bucket.artifact_bucket.bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner           = "AWS"
      provider        = "CodeCommit"
      version         = "1"
      output_artifacts = ["SourceArtifact"]

      configuration = {
        RepositoryName = var.git_repo_name
        BranchName     = var.git_branch
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      version         = "1"
      input_artifacts  = ["SourceArtifact"]
      output_artifacts = ["BuildArtifact"]

      configuration = {
        ProjectName = aws_codebuild_project.codebuild_project.name
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner          = "AWS"
      provider       = "CodeDeploy"
      version        = "1"
      input_artifacts = ["BuildArtifact"]

      configuration = {
        ApplicationName     = aws_codedeploy_app.my_app.name
        DeploymentGroupName = aws_codedeploy_deployment_group.my_app_deployment_group.deployment_group_name
      }
    }
  }
}

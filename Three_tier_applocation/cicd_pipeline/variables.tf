variable "git_repo_name" {
  description = "GitHub repository name"
  type        = string
}

variable "git_branch" {
  description = "Branch to deploy"
  type        = string
}

variable "s3_bucket_name" {
  description = "S3 bucket for artifacts"
  type        = string
}

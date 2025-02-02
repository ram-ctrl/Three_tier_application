
### **1. main.tf**

// Create an IAM Role for CodeDeploy
resource "aws_iam_role" "codedeploy_role" {
  name = var.codedeploy_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "codedeploy.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

// Attach a policy to the CodeDeploy role
resource "aws_iam_role_policy" "codedeploy_policy" {
  name = "${var.codedeploy_role_name}-policy"
  role = aws_iam_role.codedeploy_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "autoscaling:CompleteLifecycleAction",
          "autoscaling:DeleteLifecycleHook",
          "autoscaling:DescribeAutoScalingGroups",
          "autoscaling:DescribeLifecycleHooks",
          "autoscaling:RecordLifecycleActionHeartbeat",
          "ec2:DescribeInstances"
        ],
        Resource = "*"
      }
    ]
  })
}

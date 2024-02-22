# Create an IAM user
resource "aws_iam_user" "ecr_user" {
  name = "ecr_user"
}


# Create a policy allowing the IAM user to manage ECR repositories
resource "aws_iam_policy" "ecr_policy" {
  name        = "ecr_policy"
  description = "Policy for managing ECR repositories"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect   = "Allow",
      Action   = [
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "ecr:InitiateLayerUpload",
        "ecr:UploadLayerPart",
        "ecr:CompleteLayerUpload",
        "ecr:PutImage"
      ],
      Resource = "*"
    }]
  })
}

# Attach the policy to the IAM user
resource "aws_iam_user_policy_attachment" "ecr_policy_attachment" {
  user       = aws_iam_user.ecr_user.name
  policy_arn = aws_iam_policy.ecr_policy.arn
}

# Create the ECR repository
resource "aws_ecr_repository" "lil_repository" {
  name = "amazon-ecr"
  # Additional repository configurations can be added here if needed
}

# Output ECR repository URL
output "ecr_repository_url" {
  value = "${aws_ecr_repository.lil_repository.repository_url}"
}

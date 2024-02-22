# Create ECR repository
resource "aws_ecr_repository" "my_repository" {
  name = "my-ecr-repository"
}

# Output ECR repository URL
output "ecr_repository_url" {
  value = "${aws_ecr_repository.my_repository.repository_url}"
}

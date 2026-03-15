output "aws_ecr_repository_arn" {
  value = aws_ecr_repository.this.arn
}

output "aws_ecr_repository_registry_id" {
  value = aws_ecr_repository.this.registry_id
}

output "aws_ecr_repository_repository_url" {
  value = aws_ecr_repository.this.repository_url
}
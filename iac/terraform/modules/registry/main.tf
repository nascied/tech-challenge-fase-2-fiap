resource "aws_ecr_repository" "this" {
  name = "${local.resource_prefix_name}-reg"

  image_scanning_configuration {
    scan_on_push = true
  }
}


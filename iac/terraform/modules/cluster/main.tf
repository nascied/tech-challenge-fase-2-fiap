resource "aws_eks_cluster" "this" {
  name     = "${local.resource_prefix_name}-eks"
  version  = "1.31"
  role_arn = data.aws_iam_role.this.arn

  access_config {
    authentication_mode = "API_AND_CONFIG_MAP"
  }

  vpc_config {
    subnet_ids = var.aws_subnet_public_ids
  }

  depends_on = [
    data.aws_iam_role.this
  ]
}

resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${local.resource_prefix_name}-mng"
  node_role_arn   = data.aws_iam_role.this.arn
  subnet_ids      = var.aws_subnet_public_ids
  instance_types  = ["t3.medium"]
  capacity_type   = "ON_DEMAND"

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  depends_on = [
    aws_eks_cluster.this,
    data.aws_iam_role.this
  ]
}
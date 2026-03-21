module "vpc" {
  source = "./modules/network"

  aws_vpc = var.aws_vpc

}

module "db" {
  source = "./modules/rds"

  rds                        = var.rds
  aws_subnet_ids             = module.vpc.private_subnet_id
  aws_db_subnet_group_vpc_id = module.vpc.vpc_id

  depends_on = [module.vpc]
}

module "eks" {
  source = "./modules/cluster"

  aws_subnet_public_ids   = module.vpc.public_subnet_id
  aws_subnet_private_ids  = module.vpc.private_subnet_id
  aws_eks_cluster_version = var.aws_eks_cluster_version

  depends_on = [module.vpc]
}

module "ecr" {
  source = "./modules/registry"

  depends_on = [module.eks]
}

module "sqs" {
  source = "./modules/sqs"

  aws_sqs_queue_name = var.aws_sqs_queue_name

  depends_on = [module.vpc]
}

module "cache" {
  source = "./modules/elasticache"

  subnet_elasticache_group = module.vpc.private_subnet_id

  depends_on = [module.vpc]
}

module "dynamodb" {
  source = "./modules/dynamodb"

  aws_dynamodb_table_name = var.aws_dynamodb_table_name

  depends_on = [module.vpc]
}
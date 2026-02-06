provider "aws" {
  region = "us-east-1"
}

module "network" {
  source          = "../../modules/vpc"
  env             = "prod"
  vpc_cidr        = var.vpc_cidr
  private_subnets = var.private_subnets
  db_subnets      = var.db_subnets
  azs             = var.azs
}

module "eks_cluster" {
  source           = "../../modules/eks"
  env              = "prod"
  vpc_id           = module.network.vpc_id
  subnet_ids       = module.network.private_subnet_ids
  cluster_role_arn = var.eks_role_arn
}
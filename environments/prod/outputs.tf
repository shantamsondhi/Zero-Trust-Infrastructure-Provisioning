output "prod_eks_endpoint" {
  value = module.eks_cluster.cluster_endpoint
}

output "prod_oidc_url" {
  value = module.eks_cluster.oidc_issuer_url
}
output "cluster_endpoint" {
  value = aws_eks_cluster.cluster.endpoint
}

output "oidc_issuer_url" {
  value = aws_eks_cluster.cluster.identity[0].oidc[0].issuer
}
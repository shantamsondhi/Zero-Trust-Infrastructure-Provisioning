resource "aws_eks_cluster" "cluster" {
  name     = "${var.env}-eks"
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
    endpoint_public_access = false # Restricts API access to VPC
    endpoint_private_access = true
  }
}

# OIDC for Service Accounts
data "tls_certificate" "certs" {
  url = aws_eks_cluster.cluster.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "oidc" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.certs.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.cluster.identity[0].oidc[0].issuer
}
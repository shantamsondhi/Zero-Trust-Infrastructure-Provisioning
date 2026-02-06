# Zero-Trust-Infrastructure-Provisioning

Security Architecture: Data Tier Isolation

No Routing: The database subnets are created without a route to the Internet Gateway (IGW) or NAT Gateway.

Network ACLs: Inbound traffic is restricted to only allow the VPC CIDR.

Security Groups: The database instances should only allow ingress from the eks-node-sg security group.

No Public Access: The EKS cluster is configured with endpoint_public_access = false, meaning the API is only reachable from within the VPC or via a VPN/Direct Connect.
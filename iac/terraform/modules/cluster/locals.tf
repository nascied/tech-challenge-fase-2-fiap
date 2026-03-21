locals {
  resource_prefix_name = "fiap-tc-f2"
  aws_eks_add_ons = [
    "kube-proxy",
    "coredns",
    "metrics-server",
    "external-dns",
    "vpc-cni",
    "eks-node-monitoring-agent",
    "eks-pod-identity-agent"
  ]


  # eks_access_entries = [
  #   {

  #     principal_arn = "arn:aws:iam::226226079541:role/aws-service-role/eks.amazonaws.com/AWSServiceRoleForAmazonEKS"
  #     username      = "arn:aws:sts::226226079541:assumed-role/AWSServiceRoleForAmazonEKS/{{SessionName}}"
  #     policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSEventPolicy"
  #     type          = "STANDARD"
  #   },
  #   {
  #     principal_arn = "arn:aws:iam::226226079541:role/voclabs"
  #     username      = "arn:aws:sts::226226079541:assumed-role/voclabs/{{SessionName}}"
  #     policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  #     type          = "STANDARD"
  # }]

}
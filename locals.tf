locals {
  tags = {
    "Project" : "aws-eks"
    "owner" : "Gustavo Sousa"
  }
  tags_subnet_public_eks = {
    "kubernetes.io/role/elb" : 1
  }
}
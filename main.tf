terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.5"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.31.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.14.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "kubernetes" {
  host                   = module.cluster.eks_cluster_endpoint
  cluster_ca_certificate = base64decode(module.cluster.eks_cluster_certificate)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", module.cluster.cluster_name_to_mng]
    command     = "aws"
  }
}

provider "helm" {
  kubernetes {
    host                   = module.cluster.eks_cluster_endpoint
    cluster_ca_certificate = base64decode(module.cluster.eks_cluster_certificate)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", module.cluster.cluster_name_to_mng]
      command     = "aws"
    }
  }
}
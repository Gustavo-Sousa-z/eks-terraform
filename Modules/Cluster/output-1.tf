output "oidc" {
  description = "Output do oidc que pode ser aplicado na criacao no ingress utilizando ELB"
  value       = data.tls_certificate.eks_oidc_tls_certificate.certificates[*].sha1_fingerprint
}
output "cluster_name_to_mng" {
  description = "Output retornado para o modulo de Manage Node Group"
  value       = aws_eks_cluster.eks_cluster.name
}

output "oidc_to_controller" {
  description = "Output do oidc que pode ser aplicado na criacao no ingress utilizando ELB"
  value       = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

output "eks_cluster_endpoint" {
  description = "Output endpoint do cluster que pode ser aplicado na criacao no ingress utilizando ELB"
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "eks_cluster_certificate" {
  description = "Output certificado do cluster que pode ser aplicado na criacao no ingress utilizando ELB"
  value       = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}
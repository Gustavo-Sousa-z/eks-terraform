output "cluster_name" {
  description = "Nome do Cluster para utilizar na configuracao do Kubeconfig"
  value       = module.cluster.cluster_name_to_mng
}
output "oidc" {
  value = module.cluster.oidc
}
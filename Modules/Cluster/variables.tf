########################################################################################################################################################
#tags globais
variable "tags" {
  description = "Tags atreladas a todos os recursos criados"
  type        = map(string)
}
########################################################################################################################################################
# OIDC variables
variable "oidc_name" {
  description = "Nome do recurso OIDC. Defaul: oidc-cluster"
  type        = string
  default     = "oidc-cluster"
}
########################################################################################################################################################
# Cluster role variables
variable "role_cluster_name" {
  description = "Nsome da role do cluter. Default: role-eks-cluster"
  type        = string
  default     = "role-eks-cluster"
}
########################################################################################################################################################
# Cluster variables
variable "eks_cluster_name" {
  description = "Nome do cluster eks. Defaul: Cluster-eks"
  type        = string
  default     = "Cluster-eks"
}
variable "public_subnet" {
  description = "Subnets publica que serão utilizadas no cluster. Retornadas a partir do output do modulo Network"
  type        = list(string)
}
variable "endpoint_private_access" {
  description = "(Opcional) Se o endpoint do servidor de API privada do Amazon EKS está habilitado. O Default true"
  type        = bool
  default     = true
}
variable "endpoint_public_access" {
  description = "(Opcional) Se o endpoint do servidor de API pública do Amazon EKS está habilitado. O Default é true."
  type        = bool
  default     = true
}
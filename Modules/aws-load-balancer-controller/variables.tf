variable "tags" {
  description = "Tag que será incluida em todos os recursos como nome do projeto para filtro"
  type        = map(string)
}

variable "eks_controller_policy_name" {
  description = "Nome da policy do controller (ELB)"
  type        = string
  default     = "eks_controller_policy"
}

variable "eks_controller_role_name" {
  description = "Nome da role do controller (ELB)"
  type        = string
  default     = "eks_controller_role"
}

variable "oidc" {
  description = "URL https vinda do OIDC provider que será utilizada na role do controller"
  type        = string
}

variable "cluster_name" {
  description = "Nome do cluster para o helm"
  type        = string
}
variable "name_controller" {
  type    = string
  default = "aws-load-balancer-controller"
}
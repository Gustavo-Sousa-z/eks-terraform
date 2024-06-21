########################################################################################################################################################disk_size
#tags globais
variable "tags" {
  description = "Tag que sera incluida em todos os recursos como nome do projeto para filtro"
  type        = map(string)
}
########################################################################################################################################################
# Manage Node Group Variables
variable "eks_mng_role_name" {
  description = "Nome da role do manage group. Default eks-mng-role"
  type        = string
  default     = "eks-mng-role"
}
variable "public_subnet" {
  description = "Subnets publica que serão utilizadas no cluster"
  type        = list(string)
}
variable "cluster_name" {
  description = "Nome do cluster para utilizar no mng. Default output retornado do modulo Cluster"
  type        = string
}
variable "scaling_config" {
  description = "(Obrigatorio) Bloco de configuração com configuracoes de escala. Veja scaling_config abaixo para detalhes. \n desired_size - (Obrigatorio) Numero desejado de nos de trabalho. Default: 2 \n max_size - (Obrigatorio) Numero maximo de nos de trabalho. Default: 3 \n min_size - (Obrigatorio) Numero minimo de nos de trabalho. Default: 1"
  type        = list(number)
  default     = [2, 3, 1]
}
variable "node_group_name" {
  description = "Nome do Manage Node Group"
  type        = string
  default     = "eks_mng"
}
variable "ami_type" {
  description = "(Opcional) Tipo de Amazon Machine Image (AMI) associado ao EKS Node Group. Consulte a documentação da AWS para obter valores validos. Default AL2_x86_64"
  type        = string
  default     = "AL2_x86_64"
}
variable "capacity_type" {
  description = "(Opcional) Tipo de capacidade associada ao EKS Node Group. Valores validos: ON_DEMAND, SPOT. O Terraform só executare a deteccao de desvio se um valor de configuracao for fornecido. Default: SPOT"
  type        = string
  default     = "SPOT"
}
variable "disk_size" {
  description = "(Opcional) Tamanho do disco em GiB para nos de trabalho. O padrao é 50 para Windows, 20 para todos os outros grupos de nos. O Terraform so executara a deteccao de desvio se um valor de configuracao for fornecido."
  type        = number
}
variable "instance_types" {
  description = "(Opcional) Lista de tipos de instancia associados ao EKS Node Group. O padrao e [t3.medium]."
  type        = list(string)
}
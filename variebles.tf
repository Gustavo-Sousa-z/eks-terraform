########################################################################################################################################################
# VPC variables
variable "vpc_cidr_block" {
  description = "Cidr_block da VPC que tambem sera utilizado no calculo para as subnets. Default: 10.1.0.0/16"
  type        = string
  default     = "10.1.0.0/16"
}
variable "barramento_cidr_block" {
  description = "Esse valor sera utilizado como parametro na funcao cidrsubnet nas subnets. Default: 8"
  type        = number
  default     = 8
}
variable "enable_dns_hostnames" {
  description = "(Opcional) Um sinalizador booleano para habilitar/desabilitar nomes de host DNS na VPC. O default e true."
  type        = bool
  default     = true
}
variable "enable_dns_support" {
  description = "(Opcional) Um sinalizador booleano para habilitar/desabilitar o suporte a DNS na VPC. O default e true."
  type        = bool
  default     = true
}
variable "vpc_name" {
  description = "Nome da VPC. Default: eks-vpc"
  type        = string
  default     = "vpc-eks"
}
########################################################################################################################################################
# Public subnets variables
variable "map_public_ip_on_launch" {
  description = "(Opcional) Especifique true para indicar que instancias iniciadas na sub-rede devem receber um endereco IP publico. O default e true."
  type        = bool
  default     = true
}
variable "private_dns_hostname_type_on_launch" {
  description = "(Opcional) O tipo de nomes de host a serem atribuidos a instancias na sub-rede na inicializacao. Para sub-redes somente IPv6, um nome DNS de instancia deve ser baseado no ID da instancia. Para sub-redes dual-stack e somente IPv4, voce pode especificar se os nomes DNS usam o endereco IPv4 da instancia ou o ID da instancia. Valores validos: ip-name, resource-name. Default e ip-name."
  type        = string
  default     = "ip-name"
}
variable "availability_zone" {
  description = "AZ para a sub-rede."
  type        = list(string)
}
variable "subnets_public_number" {
  description = "Especifique o numero de subnets que devem ser criadas. OBS..: Numeros inteiros - Default: 3"
  type        = number
}
########################################################################################################################################################
# Internet gateway variables
variable "igw_name" {
  description = "Nome do internet Gateway. Default: igw-eks"
  type        = string
  default     = "igw-eks"
}
########################################################################################################################################################
# Tabela de Rotas variables
variable "rt_public_name" {
  description = "Nome da tabela de rotas publica. Default: Rt-Public"
  type        = string
  default     = "Rt-Public"
}
########################################################################################################################################################
# OIDC variables
variable "oidc_name" {
  description = "Nome do recurso OIDC. Default: oidc-cluster"
  type        = string
  default     = "oidc-cluster"
}
########################################################################################################################################################
# Cluster role variables
variable "role_cluster_name" {
  description = "Nome da role do cluster. Default: role-eks-cluster"
  type        = string
  default     = "role-eks-cluster"
}
########################################################################################################################################################
# Cluster variables
variable "eks_cluster_name" {
  description = "Nome do cluster eks. Default: Cluster-eks"
  type        = string
  default     = "Cluster-eks"
}
#variable "public_subnet" {
#  description = "Subnets publicas que serao utilizadas no cluster"
#  type        = list(string)
#}
variable "endpoint_private_access" {
  description = "(Opcional) Se o endpoint do servidor de API privada do Amazon EKS esta habilitado. O Default true"
  type        = bool
  default     = true
}
variable "endpoint_public_access" {
  description = "(Opcional) Se o endpoint do servidor de API publica do Amazon EKS esta habilitado. O Default e true."
  type        = bool
  default     = true
}
########################################################################################################################################################
# Manage Node Group variables
variable "eks_mng_role_name" {
  description = "Nome da role do manage group. Default eks-mng-role-name"
  type        = string
  default     = "eks-mng-role-name"
}
variable "disk_size" {
  description = "(Opcional) Tamanho do disco em GiB para nos de trabalho. O padrao e 50 para Windows, 20 para todos os outros grupos de nos. O Terraform so executara a deteccao de desvio se um valor de configuracao for fornecido."
  type        = number
}
variable "scaling_config" {
  description = "(Obrigatorio) Bloco de configuracao com configuracoes de escala. Veja scaling_config abaixo para detalhes. \n desired_size - (Required) Desired number of worker nodes. Default: 2 \n max_size - (Required) Maximum number of worker nodes. Default: 3 \n min_size - (Required) Minimum number of worker nodes. Default: 1"
  type        = list(number)
  default     = [2, 3, 1]
}
variable "node_group_name" {
  description = "Nome do mng"
  type        = string
  default     = "eks_mng"
}
variable "instance_types" {
  description = "(Opcional) Lista de tipos de instancia associados ao EKS Node Group. O padrao e [t3.medium]. Default t2.small"
  type        = list(string)
}

########################################################################################################################################################
#tags globais
variable "tags" {
  description = "Tags atreladas a todos os recursos criados"
  type        = map(string)
}
#tags eks-elb
variable "tags_subnet_public_eks" {
  description = "Tag para implantar ELB em subnet publica"
  type        = map(string)
  default = {
    "kubernetes.io/role/elb" = "1"
  }
}
########################################################################################################################################################
# VPC variables
variable "vpc_cidr_block" {
  description = "Cidr_block da VPC que também será utilizado no calculo para as subnets."
  type        = string
}
variable "barramento_cidr_block" {
  description = "Esse valor será utilizado como parametro na função cidrsubnet nas subnets."
  type        = number
}
variable "enable_dns_hostnames" {
  description = "(Opcional) Um sinalizador booleano para habilitar/desabilitar nomes de host DNS na VPC. O default é true."
  type        = bool
  default     = true
}
variable "enable_dns_support" {
  description = "(Opcional) Um sinalizador booleano para habilitar/desabilitar o suporte a DNS na VPC. O default é true."
  type        = bool
  default     = true
}
variable "vpc_name" {
  description = "Nome da VPC. Defaul: eks-vpc"
  type        = string
  default     = "eks-vpc"
}
########################################################################################################################################################
# Public subnets variables
variable "map_public_ip_on_launch" {
  description = "(Opcional) Especifique true para indicar que instâncias iniciadas na sub-rede devem receber um endereço IP público. O default é true."
  type        = bool
  default     = true
}
variable "private_dns_hostname_type_on_launch" {
  description = "(Opcional) O tipo de nomes de host a serem atribuídos a instâncias na sub-rede na inicialização. Para sub-redes somente IPv6, um nome DNS de instância deve ser baseado no ID da instância. Para sub-redes dual-stack e somente IPv4, você pode especificar se os nomes DNS usam o endereço IPv4 da instância ou o ID da instância. Valores válidos: ip-name, resource-name. Default é ip-name."
  type        = string
  default     = "ip-name"
}
variable "availability_zone" {
  description = "AZ para a sub-rede."
  type        = list(string)
}
variable "subnets_public_number" {
  description = "Especifique o número de subnets que devem ser criadas. OBS..: Números inteiros - Default: 3"
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
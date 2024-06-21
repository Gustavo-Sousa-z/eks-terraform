## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.54.1 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.0.5 |

## Exemplo de uso
```hcl
module "vpc" {
  source                 = "./Modules/Network"
  vpc_cidr_block         = "10.1.0.0/16"
  availability_zone      = ["us-east-1a", "us-east-1b", "us-east-1c"]
  barramento_cidr_block  = 8 # Valor utilizado na função cidrsubnet como parametro para "newbits"
  subnets_public_number  = 3 # Definição de quantas subnets devem ser criadas, também utilizado na função cidrsubnet como parametro "netnum"
  tags                   = local.tags # Variavel do tipo map, utilizar locals para declaração
}
module "cluster" {
  source        = "./Modules/Cluster"
  public_subnet = module.vpc.subnet_public_id # Output da vpc para definir quais subnets o cluster estara vinculado
  tags          = local.tags # Variavel do tipo map, utilizar locals para declaração
}
module "manage_node_group" {
  source         = "./Modules/Manage-node-group"
  instance_types = ["t2.small"]
  disk_size      = 20
  public_subnet  = module.vpc.subnet_public_id # Output da vpc para definir quais subnets os workers estarao vinculado
  cluster_name   = module.cluster.cluster_name_to_mng # Output do cluster para referenciar o nome do cluster a ser utilizado no Manage Node Group
  tags           = local.tags # Variavel do tipo map, utilizar locals para declaração
}
```

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cluster"></a> [cluster](#module\_cluster) | ./Modules/Cluster | n/a |
| <a name="module_manage_node_group"></a> [manage\_node\_group](#module\_manage\_node\_group) | ./Modules/Manage-node-group | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./Modules/Network | n/a |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Nome do Cluster para utilizar na configuracao do Kubeconfig |


## Resources Network

| Name | Type |
|------|------|
| [aws_default_route_table.rt_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_route_table) | resource |
| [aws_internet_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route_table_association.attach_rt_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | AZ para a sub-rede. | `list(string)` | n/a | yes |
| <a name="input_barramento_cidr_block"></a> [barramento\_cidr\_block](#input\_barramento\_cidr\_block) | Esse valor ser├í utilizado como parametro na fun├º├úo cidrsubnet nas subnets. | `number` | n/a | yes |
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | (Opcional) Um sinalizador booleano para habilitar/desabilitar nomes de host DNS na VPC. O default ├® true. | `bool` | `true` | no |
| <a name="input_enable_dns_support"></a> [enable\_dns\_support](#input\_enable\_dns\_support) | (Opcional) Um sinalizador booleano para habilitar/desabilitar o suporte a DNS na VPC. O default ├® true. | `bool` | `true` | no |
| <a name="input_igw_name"></a> [igw\_name](#input\_igw\_name) | Nome do internet Gateway. Default: igw-eks | `string` | `"igw-eks"` | no |
| <a name="input_map_public_ip_on_launch"></a> [map\_public\_ip\_on\_launch](#input\_map\_public\_ip\_on\_launch) | (Opcional) Especifique true para indicar que inst├óncias iniciadas na sub-rede devem receber um endere├ºo IP p├║blico. O default ├® true. | `bool` | `true` | no |
| <a name="input_private_dns_hostname_type_on_launch"></a> [private\_dns\_hostname\_type\_on\_launch](#input\_private\_dns\_hostname\_type\_on\_launch) | (Opcional) O tipo de nomes de host a serem atribu├¡dos a inst├óncias na sub-rede na inicializa├º├úo. Para sub-redes somente IPv6, um nome DNS de inst├óncia deve ser baseado no ID da inst├óncia. Para sub-redes dual-stack e somente IPv4, voc├¬ pode especificar se os nomes DNS usam o endere├ºo IPv4 da inst├óncia ou o ID da inst├óncia. Valores v├ílidos: ip-name, resource-name. Default ├® ip-name. | `string` | `"ip-name"` | no |
| <a name="input_rt_public_name"></a> [rt\_public\_name](#input\_rt\_public\_name) | Nome da tabela de rotas publica. Default: Rt-Public | `string` | `"Rt-Public"` | no |
| <a name="input_subnets_public_number"></a> [subnets\_public\_number](#input\_subnets\_public\_number) | Especifique o n├║mero de subnets que devem ser criadas. OBS..: N├║meros inteiros - Default: 3 | `number` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags atreladas a todos os recursos criados | `map(string)` | n/a | yes |
| <a name="input_tags_subnet_public_eks"></a> [tags\_subnet\_public\_eks](#input\_tags\_subnet\_public\_eks) | Tag para implantar ELB em subnet publica | `map(string)` | n/a | yes |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | Cidr\_block da VPC que tamb├®m ser├í utilizado no calculo para as subnets. | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Nome da VPC. Defaul: eks-vpc | `string` | `"eks-vpc"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_public_id"></a> [subnet\_public\_id](#output\_subnet\_public\_id) | Output utilizado utilizado para repassar o id das subnets criadas para o Cluster e Manage node Group |

## Resources Cluster

| Name | Type |
|------|------|
| [aws_eks_cluster.eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_iam_openid_connect_provider.eks_oidc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.eks_cluster_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.eks_role_policy_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [tls_certificate.eks_oidc_tls_certificate](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_eks_cluster_name"></a> [eks\_cluster\_name](#input\_eks\_cluster\_name) | Nome do cluster eks. Defaul: Cluster-eks | `string` | `"Cluster-eks"` | no |
| <a name="input_endpoint_private_access"></a> [endpoint\_private\_access](#input\_endpoint\_private\_access) | (Opcional) Se o endpoint do servidor de API privada do Amazon EKS est├í habilitado. O Default true | `bool` | `true` | no |
| <a name="input_endpoint_public_access"></a> [endpoint\_public\_access](#input\_endpoint\_public\_access) | (Opcional) Se o endpoint do servidor de API p├║blica do Amazon EKS est├í habilitado. O Default ├® true. | `bool` | `true` | no |
| <a name="input_oidc_name"></a> [oidc\_name](#input\_oidc\_name) | Nome do recurso OIDC. Defaul: oidc-cluster | `string` | `"oidc-cluster"` | no |
| <a name="input_public_subnet"></a> [public\_subnet](#input\_public\_subnet) | Subnets publica que ser├úo utilizadas no cluster. Retornadas a partir do output do modulo Network | `list(string)` | n/a | yes |
| <a name="input_role_cluster_name"></a> [role\_cluster\_name](#input\_role\_cluster\_name) | Nsome da role do cluter. Default: role-eks-cluster | `string` | `"role-eks-cluster"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags atreladas a todos os recursos criados | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_name_to_mng"></a> [cluster\_name\_to\_mng](#output\_cluster\_name\_to\_mng) | Output retornado para o modulo de Manage Node Group |
| <a name="output_eks_cluster_certificate"></a> [eks\_cluster\_certificate](#output\_eks\_cluster\_certificate) | Output certificado do cluster que pode ser aplicado na criacao no ingress utilizando ELB |
| <a name="output_eks_cluster_endpoint"></a> [eks\_cluster\_endpoint](#output\_eks\_cluster\_endpoint) | Output endpoint do cluster que pode ser aplicado na criacao no ingress utilizando ELB |
| <a name="output_oidc"></a> [oidc](#output\_oidc) | Output do oidc que pode ser aplicado na criacao no ingress utilizando ELB |
| <a name="output_oidc_to_controller"></a> [oidc\_to\_controller](#output\_oidc\_to\_controller) | Output do oidc que pode ser aplicado na criacao no ingress utilizando ELB |

## Resources Manage Node Group

| Name | Type |
|------|------|
| [aws_eks_node_group.eks_mng](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_role.eks_mng_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.eks_role_mng_attach_cni](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_role_mng_attach_ecr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_role_mng_attach_worker](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_type"></a> [ami\_type](#input\_ami\_type) | (Opcional) Tipo de Amazon Machine Image (AMI) associado ao EKS Node Group. Consulte a documenta├º├úo da AWS para obter valores validos. Default AL2\_x86\_64 | `string` | `"AL2_x86_64"` | no |
| <a name="input_capacity_type"></a> [capacity\_type](#input\_capacity\_type) | (Opcional) Tipo de capacidade associada ao EKS Node Group. Valores validos: ON\_DEMAND, SPOT. O Terraform s├│ executare a deteccao de desvio se um valor de configuracao for fornecido. Default: SPOT | `string` | `"SPOT"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Nome do cluster para utilizar no mng. Default output retornado do modulo Cluster | `string` | n/a | yes |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | (Opcional) Tamanho do disco em GiB para nos de trabalho. O padrao ├® 50 para Windows, 20 para todos os outros grupos de nos. O Terraform so executara a deteccao de desvio se um valor de configuracao for fornecido. | `number` | n/a | yes |
| <a name="input_eks_mng_role_name"></a> [eks\_mng\_role\_name](#input\_eks\_mng\_role\_name) | Nome da role do manage group. Default eks-mng-role | `string` | `"eks-mng-role"` | no |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | (Opcional) Lista de tipos de instancia associados ao EKS Node Group. O padrao e [t3.medium]. | `list(string)` | n/a | yes |
| <a name="input_node_group_name"></a> [node\_group\_name](#input\_node\_group\_name) | Nome do Manage Node Group | `string` | `"eks_mng"` | no |
| <a name="input_public_subnet"></a> [public\_subnet](#input\_public\_subnet) | Subnets publica que ser├úo utilizadas no cluster | `list(string)` | n/a | yes |
| <a name="input_scaling_config"></a> [scaling\_config](#input\_scaling\_config) | (Obrigatorio) Bloco de configura├º├úo com configuracoes de escala. Veja scaling\_config abaixo para detalhes. <br> desired\_size - (Obrigatorio) Numero desejado de nos de trabalho. Default: 2 <br> max\_size - (Obrigatorio) Numero maximo de nos de trabalho. Default: 3 <br> min\_size - (Obrigatorio) Numero minimo de nos de trabalho. Default: 1 | `list(number)` | <pre>[<br>  2,<br>  3,<br>  1<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tag que sera incluida em todos os recursos como nome do projeto para filtro | `map(string)` | n/a | yes |

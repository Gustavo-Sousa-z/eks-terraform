<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.eks_controller_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.eks_controller_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.eks_controller_role_policy_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [helm_release.eks_helm_controller](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_service_account.eks_controller_sa](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
| [aws_caller_identity.eks_account](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.eks_region](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Nome do cluster para o helm | `string` | n/a | yes |
| <a name="input_eks_controller_policy_name"></a> [eks\_controller\_policy\_name](#input\_eks\_controller\_policy\_name) | Nome da policy do controller (ELB) | `string` | `"eks_controller_policy"` | no |
| <a name="input_eks_controller_role_name"></a> [eks\_controller\_role\_name](#input\_eks\_controller\_role\_name) | Nome da role do controller (ELB) | `string` | `"eks_controller_role"` | no |
| <a name="input_oidc"></a> [oidc](#input\_oidc) | URL https vinda do OIDC provider que será utilizada na role do controller | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tag que será incluida em todos os recursos como nome do projeto para filtro | `map(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
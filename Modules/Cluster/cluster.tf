# Criação do Cluster eks vinculando as subnets criadas no modulo de network
# Habilitando o endpoint privado e publico
# e criando a dependencia com a role e police atachada anteriormente
resource "aws_eks_cluster" "eks_cluster" {

  name     = var.eks_cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access
    subnet_ids              = var.public_subnet
  }
  # Necessário atribuir uma dependencia do cluster ao attach da police a role
  # Porque no momento de destroir tudo, o cluster pode perder as permissões para executar a ação
  # causando assim um problema para limpar os recursos
  depends_on = [
    aws_iam_role_policy_attachment.eks_role_policy_attach
  ]

  tags = merge(
    var.tags,
    {
      Name : var.eks_cluster_name
    }
  )
}
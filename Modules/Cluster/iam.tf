#Criação da Role e atribuição da police para permitir a criação do cluster EKS
resource "aws_iam_role" "eks_cluster_role" {
  name = var.role_cluster_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })

  tags = merge(
    var.tags,
    {
      Name = var.role_cluster_name
    }
  )
}

# Atachando a police necessária para o cluster a role que haviamos criada para o cluster
resource "aws_iam_role_policy_attachment" "eks_role_policy_attach" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}
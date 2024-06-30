#Criação da Role e atribuição da police para permitir a criação do cluster EKS
resource "aws_iam_role" "eks_controller_role" {
  name = "aws-load-balancer-controller"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::${data.aws_caller_identity.eks_account.account_id}:oidc-provider/oidc.eks.${data.aws_region.eks_region.name}.amazonaws.com/id/${local.oidc_to_provider}"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringEquals": {
                    "oidc.eks.${data.aws_region.eks_region.name}.amazonaws.com/id/${local.oidc_to_provider}:aud": "sts.amazonaws.com","oidc.eks.${data.aws_region.eks_region.name}.amazonaws.com/id/${local.oidc_to_provider}:sub": "system:serviceaccount:kube-system:${var.name_controller}"
                }
            }
        }
    ]
}
EOF

  tags = merge(
    var.tags,
    {
      Name = "aws-load-balancer-controller"
    }
  )
}

# Atachando a police necessária para o cluster a role que haviamos criada para o cluster
resource "aws_iam_role_policy_attachment" "eks_controller_role_policy_attach" {
  role       = aws_iam_role.eks_controller_role.name
  policy_arn = aws_iam_policy.eks_controller_policy.arn
}
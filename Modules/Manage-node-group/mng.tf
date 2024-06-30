resource "aws_eks_node_group" "eks_mng" {
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.eks_mng_role.arn
  subnet_ids      = var.public_subnet

  ami_type       = var.ami_type
  capacity_type  = var.capacity_type
  disk_size      = var.disk_size
  instance_types = var.instance_types

  scaling_config {
    desired_size = element(var.scaling_config, 0)
    max_size     = element(var.scaling_config, 1)
    min_size     = element(var.scaling_config, 2)
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_role_mng_attach_worker,
    aws_iam_role_policy_attachment.eks_role_mng_attach_ecr,
    aws_iam_role_policy_attachment.eks_role_mng_attach_cni
  ]
  tags = merge(
    var.tags,
    {
      Name = var.node_group_name
    }
  )
}
resource "kubernetes_service_account" "eks_controller_sa" {
  metadata {
    name      = "aws-load-balancer-controller"
    namespace = "kube-system"
    annotations = {
      "eks.amazonaws.com/role-arn"     = aws_iam_role.eks_controller_role.arn,
      "meta.helm.sh/release-name"      = "aws-load-balancer-controller",
      "meta.helm.sh/release-namespace" = "kube-system",
      "app.kubernetes.io/managed-by"   = "Helm"
    }
  }
  depends_on = [
    aws_iam_role.eks_controller_role
  ]
}
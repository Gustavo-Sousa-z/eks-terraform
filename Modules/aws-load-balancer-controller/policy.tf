resource "aws_iam_policy" "eks_controller_policy" {
  name        = "aws-load-balancer-controller"
  description = "Politica para uso do controller (ELB)"
  policy      = file("${path.module}/controller.json")
  tags = merge(
    var.tags,
    {
      Name = "aws-load-balancer-controller"
    }
  )
}
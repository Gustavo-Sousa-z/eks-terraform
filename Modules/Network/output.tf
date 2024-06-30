output "subnet_public_id" {
  description = "Output utilizado utilizado para repassar o id das subnets criadas para o Cluster e Manage node Group"
  value       = aws_subnet.public[*].id
}
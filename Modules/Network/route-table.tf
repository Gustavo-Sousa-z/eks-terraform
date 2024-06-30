##################################################################################################################################
# Tabela de Rotas
##################################################################################################################################
resource "aws_default_route_table" "rt_public" {
  default_route_table_id = aws_vpc.this.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  depends_on = [
    aws_vpc.this,
    aws_internet_gateway.this
  ]

  tags = merge(
    var.tags,
    {
      Name : var.rt_public_name
    }
  )
}
##################################################################################################################################
# Associação com tabela de rotas: rt_public
##################################################################################################################################
resource "aws_route_table_association" "attach_rt_public" {
  count = var.subnets_public_number

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_default_route_table.rt_public.id
}
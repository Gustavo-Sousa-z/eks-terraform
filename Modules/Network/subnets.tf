##################################################################################################################################
# Subnets Publicas                                                    
##################################################################################################################################
resource "aws_subnet" "public" {

  count = var.subnets_public_number

  vpc_id                              = aws_vpc.this.id
  availability_zone                   = element(var.availability_zone, count.index)
  cidr_block                          = cidrsubnet(var.vpc_cidr_block, var.barramento_cidr_block, count.index)
  map_public_ip_on_launch             = var.map_public_ip_on_launch
  private_dns_hostname_type_on_launch = var.private_dns_hostname_type_on_launch

  tags = merge(
    var.tags,
    var.tags_subnet_public_eks,
    {
      Name : "Subnet${substr("${element(var.availability_zone, count.index)}", 7, 10)}"
    }
  )
}
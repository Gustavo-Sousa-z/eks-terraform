module "vpc" {
  source                = "./Modules/Network"
  vpc_cidr_block        = var.vpc_cidr_block
  availability_zone     = var.availability_zone
  barramento_cidr_block = var.barramento_cidr_block
  subnets_public_number = var.subnets_public_number
  tags                  = local.tags
}
module "cluster" {
  source        = "./Modules/Cluster"
  public_subnet = module.vpc.subnet_public_id
  tags          = local.tags
}
module "manage_node_group" {
  source         = "./Modules/Manage-node-group"
  instance_types = var.instance_types
  disk_size      = var.disk_size
  public_subnet  = module.vpc.subnet_public_id
  cluster_name   = module.cluster.cluster_name_to_mng
  tags           = local.tags
}
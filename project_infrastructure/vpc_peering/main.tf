# Module to deploy basic vpc peering
module "main_vpc_peer" {
  source              = "../../modules/vpc_peering"
  peer_env            = var.peer_env
  env                 = var.env
  prod_cidr           = var.prod_cidr
  nonprod_cidr        = var.nonprod_cidr

}
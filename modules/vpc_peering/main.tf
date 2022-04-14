#adding all environment states 
data "terraform_remote_state" "network" { // This is to use Outputs from Remote State
  count=length(var.peer_env)
  backend = "s3"
  config = {
    bucket = "${var.peer_env[count.index]}-acs730-assignment"         // Bucket from where to GET Terraform State
    key    = "${var.peer_env[count.index]}-network/terraform.tfstate" // Object name in the bucket to GET Terraform State
    region = "us-east-1"                            // Region where bucket created
  }
}


# Retrieve global variables from the Terraform module
module "globalvars" {
  source = "../globalvars"
}


locals {
  default_tags = merge(module.globalvars.default_tags, { "env" = var.env })
  prefix       = module.globalvars.prefix
  name_prefix  = "${local.prefix}-${var.env}"
}

#Creating a peering connection
resource "aws_vpc_peering_connection" "VPC_peer" {
  #peer_owner_id = var.peer_owner_id
  peer_vpc_id   = data.terraform_remote_state.network[0].outputs.vpc_id
  vpc_id        = data.terraform_remote_state.network[1].outputs.vpc_id
  auto_accept =true
  tags = merge(local.default_tags,
    {
      "Name" = "${local.name_prefix}-VPC_peering"
    }
  )
}

#Adding Peering routes both ways 
resource "aws_route" "one" {
  route_table_id = data.terraform_remote_state.network[0].outputs.public_route_table_id[0]
  destination_cidr_block= var.prod_cidr
  vpc_peering_connection_id=aws_vpc_peering_connection.VPC_peer.id
  
}


resource "aws_route" "two" {
  route_table_id = data.terraform_remote_state.network[1].outputs.prod_private_route_table_id[0]
  destination_cidr_block= var.nonprod_cidr
  vpc_peering_connection_id=aws_vpc_peering_connection.VPC_peer.id
  
}
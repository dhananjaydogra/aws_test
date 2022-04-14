output "private_subnet_ids" {
  value = module.vpc-prod.private_subnet_ids
}

output "vpc_id" {
  value = module.vpc-prod.vpc_id
}

output "prod_private_route_table_id" {
    value=module.vpc-prod.prod_private_route_table_id
}
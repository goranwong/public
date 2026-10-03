output "dev_network_name"     { value = module.vpc_dev.network_name }
output "dev_wp_subnet_name"   { value = module.vpc_dev.subnets_names[0] }
output "dev_mgmt_subnet_name" { value = module.vpc_dev.subnets_names[1] }

output "prod_network_name"    { value = module.vpc_prod.network_name }
output "prod_wp_subnet_name"   { value = module.vpc_prod.subnets_names[0] }
output "prod_mgmt_subnet_name"{ value = module.vpc_prod.subnets_names[1] }
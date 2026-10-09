output "dev_network_name"     { value = module.griffin-dev-vpc.network_name }
output "dev_mgmt_subnet_name" { value = module.griffin-dev-vpc.subnets_names[0] }
output "dev_wp_subnet_name"   { value = module.griffin-dev-vpc.subnets_names[1] }

output "prod_network_name"    { value = module.griffin-prod-vpc.network_name }
output "prod_mgmt_subnet_name"{ value = module.griffin-prod-vpc.subnets_names[0] }
output "prod_wp_subnet_name"   { value = module.griffin-prod-vpc.subnets_names[1] }
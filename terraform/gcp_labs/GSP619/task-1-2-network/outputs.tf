output "vpc_demo_network_name"    { value = module.vpc-demo.network_name }
output "vpc_demo_subnet1"         { value = module.vpc-demo.subnets_names[0] }
output "vpc_demo_subnet2"         { value = module.vpc-demo.subnets_names[1] }
output "on-prem_network_name"     { value = module.on-prem.network_name }
output "on_prem_subnet"           { value = module.on-prem.subnets_names[0] }

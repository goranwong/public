module "vpc-demo" {
    source  = "terraform-google-modules/network/google"
    version = "~> 18.3"
	
	project_id = var.project_id
	network_name = "vpc-demo"
	
	subnets = [
		{
			subnet_name   = "vpc-demo-subnet1"
			subnet_ip     = "10.1.1.0/24"
			subnet_region = var.region
			description   = "subnet 1 of VPC demo"
		},	
		{
			subnet_name   = "vpc-demo-subnet2"
			subnet_ip     = "10.2.1.0/24"
			subnet_region = var.region
			description   = "subnet 2 of VPC demo"
		}
	
	]
}

module "vpc-on-prem" {
    source  = "terraform-google-modules/network/google"
    version = "~> 18.3"
	
	project_id   = var.project_id
	network_name = "on-prem"
	
	subnets = [	
		{
			subnet_name   = "on-prem-subnet1"
			subnet_ip     = "192.168.1.0/24"
			subnet_region = var.region
			description   = "subnet 1 for on-prem"
		}			
	]
}
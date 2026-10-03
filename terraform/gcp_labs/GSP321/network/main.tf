module "griffin-dev-vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 18.3"
	
	project_id = var.project_id
	network_name = "griffin-dev-vpc"
	
	subnets = [
		{
			subnet_name   = "griffin-dev-wp"
			subnet_ip     = "192.168.16.0/20"
			subnet_region = var.region
			description   = "Development VPC for WP"
		},
		{
			subnet_name  = "griffin-dev-mgmt"
			subnet_ip    = "192.168.32.0/20"
			subnet_region = var.region
			description   = "Development VPC for MGMT"
		}
	]
}

module "griffin-prod-vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 18.3"
	
	project_id   = var.project_id
	network_name = "griffin-prod-vpc"
	
	subnets = [	
		{
			subnet_name   = "griffin-prod-wp"
			subnet_ip     = "192.168.48.0/20"
			subnet_region = var.region
			description   = "PROD VPC for WP"
		},
		{
			subnet_name  = "griffin-prod-mgmt"
			subnet_ip    = "192.168.64.0/20"
			subnet_region = var.region
			description   = "PROD VPC for MGMT"
		}			
	]
}
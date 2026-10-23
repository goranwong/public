project_id = "
region1    = "
zone1      = "
region2    = "
zone2      = "
vpcs = {
  "vpc-demo" = {
     network_name = "vpc-demo"
	
     subnets = [
     	{
     		subnet_name   = "vpc-demo-subnet1"
     		subnet_ip     = "10.1.1.0/24"
     		subnet_region = var.region1
     		description   = "subnet 1 of VPC demo"
     	},	
     	{
     		subnet_name   = "vpc-demo-subnet2"
     		subnet_ip     = "10.2.1.0/24"
     		subnet_region = var.region2
     		description   = "subnet 2 of VPC demo"
     	}
     
	]
     },
  "on-prem" {
     network_name = "on-prem"
	 subnets = [	
		{
			subnet_name   = "on-prem-subnet1"
			subnet_ip     = "192.168.1.0/24"
			subnet_region = var.region2
			description   = "subnet 1 for on-prem"
		}			
	]
}

vm_instances = {
  "vpc-demo-instance1" = {
     machine_type = var.machine_type
     zone         = var.zone1

	 boot_disk {
	 initialize_params {
		 image = var.image
	 }
	 }

     network_interface {
       subnetwork = data.terraform_remote_state.network.outputs.vpc_demo_subnet1
       access_config {}
     }
     
     metadata = {
       enable-oslogin = "TRUE"
     }
  },
  "vpc-demo-instance2"  = {
    machine_type = var.machine_type
    zone         = var.zone1

    boot_disk {
      initialize_params {
        image = var.image
      }
    }
    
    network_interface {
      subnetwork = data.terraform_remote_state.network.outputs.vpc_demo_subnet2
      access_config {}
    }
    
    metadata = {
      enable-oslogin = "TRUE"
    }
  },
  "on-prem-instance1" = {
    machine_type = var.machine_type
    zone         = var.zone2
    
    boot_disk {
      initialize_params {
        image = var.image
      }
    }
    
    network_interface {
      subnetwork = data.terraform_remote_state.network.outputs.on_prem_subnet1
      access_config {}
    }
    
    metadata = {
      enable-oslogin = "TRUE"
    }
  } 
}  
  

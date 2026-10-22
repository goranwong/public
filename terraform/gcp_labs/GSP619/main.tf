terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.0"
    }
  }
}


provider "google" {
  project = varject_id
  region  = var.region
}


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


resource "google_compute_firewall" "vpc-demo-allow-internal" {
  name    = "vpc-demo-allow-internal"
  network = data.terraform_remote_state.network.outputs.vpc_demo_network_name

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "icmp"
  }    
  source_ranges = ["10.0.0.0/8"]
}


resource "google_compute_firewall" "vpc-demo-allow-ssh-icmp" {
  name    = "vpc-demo-allow-internal"
  network = data.terraform_remote_state.network.outputs.vpc_demo_network_name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  allow {
    protocol = "icmp"
  }
}

resource "google_compute_firewall" "on-prem-allow-internal" {
  name    = "vpc-demo-allow-internal"
  network = data.terraform_remote_state.network.outputs.on_prem_network_name

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "icmp"
  }  
  source_ranges = ["192.168.0.0/16"]
}

resource "google_compute_firewall" "on-prem-allow-ssh-icmp" {
  name    = "vpc-demo-allow-internal"
  network = data.terraform_remote_state.network.outputs.on_prem_network_name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  allow {
    protocol = "icmp"
  }
}


resource "google_compute_instance" "vpc-demo-instance1" {
  name         = "vpc-demo-instance1"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = data.terraform_remote_state.network.outputs.vpc_demo_subnet1
    access_config {}
  }

  metadata = {
    enable-oslogin = "TRUE"
  }
}

resource "google_compute_instance" "vpc-demo-instance2" {
  name         = "vpc-demo-instance2"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = data.terraform_remote_state.network.outputs.vpc_demo_subnet2
    access_config {}
  }

  metadata = {
    enable-oslogin = "TRUE"
  }
}

resource "google_compute_instance" "on-prem-instance1" {
  name         = "on-prem-instance1"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
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
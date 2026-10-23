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
}

# Network Module

module "vpc" {
  for_each = var.vpcs

  source  = "terraform-google-modules/network/google"
  version = "~> 18.3"

  project_id   = var.project_id
  network_name = each.value.network_name
  subnets      = each.value.subnets
}


resource "google_compute_instance" "vm_instances" {
  for_each = var.instances

  project      = var.project_id
  name         = each.key              # "instance-zone1-vm", "instance-zone2-vm"
  machine_type = "e2-medium"
  zone         = each.value.zone       # Pulls zone from the map

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network    = each.value.network_name    # Dynamic VPC per VM
    subnetwork = each.value.subnetwork      # Dynamic Subnet per VM
    
    access_config {} 
  }
}

################ firewall rules ################ 

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



terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.0"
    }
  }
}

provider "google" {
  project = var.project_id
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
  for_each = var.vm_instances

  project      = var.project_id
  name         = each.key 
  machine_type = var.machine_type
  zone         = each.value.zone 

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = each.value.network_name 
    subnetwork = each.value.subnetwork  

    access_config {}
  }
}


resource "google_compute_firewall" "firewall_rules" {
  for_each = var.firewall_rules

  name          = each.key
  network       = each.value.network
  description   = each.value.description
  priority      = each.value.priority
  direction     = "INGRESS"
  source_ranges = each.value.source_ranges

  dynamic "allow" {
    for_each = each.value.allows
    content {
      protocol = allow.value.protocol
      ports    = length(allow.value.ports) > 0 ? allow.value.ports : null
    }
  }
}
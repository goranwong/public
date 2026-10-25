terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.0"
    }
  }
}

# Configure the Google Provider
provider "google" {
  project = var.project_id
}

module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 18.1"

  project_id   = var.project_id
  network_name = var.network_name
  routing_mode = "REGIONAL"

  subnets = var.subnets
}

module "firewall_rules" {
  source = "terraform-google-modules/network/google//modules/firewall-rules"
  #  version      = "~> 9.0"
  project_id   = var.project_id
  network_name = module.vpc.network_name

  rules = var.rules
}

resource "google_compute_instance" "vms" {
  for_each     = var.instances
  name         = each.key
  machine_type = var.machine_type
  zone         = each.value.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = module.vpc.network_name
    subnetwork = each.value.subnetwork
  }
  depends_on = [module.vpc]
}


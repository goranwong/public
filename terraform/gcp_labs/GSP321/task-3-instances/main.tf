# Read local state file from network (network)
data "terraform_remote_state" "network" {
  backend = "local"
  config = {
    path = "../01-network/terraform.tfstate"
  }
}

resource "google_compute_firewall" "allow_ssh_dev" {
  name    = "allow-ssh-dev-mgmt"
  network = data.terraform_remote_state.network.outputs.dev_network_name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["bastion"]
}

resource "google_compute_firewall" "allow_ssh_prod" {
  name    = "allow-ssh-prod-mgmt"
  network = data.terraform_remote_state.network.outputs.prod_network_name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["bastion"]
}

resource "google_compute_instance" "bastion" {
  name         = "bastion-host"
  machine_type = "e2-micro"
  zone         = var.zone
  tags         = ["bastion"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = data.terraform_remote_state.network.outputs.dev_mgmt_subnet_name
    access_config {}
  }

  network_interface {
    subnetwork = data.terraform_remote_state.network.outputs.prod_mgmt_subnet_name
  }

  metadata = {
    enable-oslogin = "TRUE"
  }
}
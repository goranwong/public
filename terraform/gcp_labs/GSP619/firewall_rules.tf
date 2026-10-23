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
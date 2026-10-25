



resource "google_compute_firewall" "on-prem-allow-internal" {
  name    = "on-prem-allow-internal"
  network = "on-prem"

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
  name    = "on-prem-allow-ssh-icmp"
  network = "on-prem"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  allow {
    protocol = "icmp"
  }
  source_ranges = ["0.0.0.0/0"]
}



rules = [{
  name               = "vpc-demo-allow-internal"
  network            = "vpc-demo"
  description        = "all internal traffic within the network"
  direction          = "INGRESS"
  priority           = "1000"
  destination_ranges = []
  source_ranges      = ["10.0.0.0/8"]
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
  deny = []
  },
  {
    name               = "vpc-demo-allow-ssh-icmp"
	network            = "vpc-demo"
    description        = "allow ssh, icmp from anywhere:"
    direction          = "INGRESS"
    priority           = "1000"
    destination_ranges = []
    source_ranges      = ["0.0.0.0/0"]
    allow {
      protocol = "tcp"
      ports    = ["22"]
    }
    allow = [{
      protocol = "icmp"
    }]
      deny = []
    },
  {
    name               = "on-prem-allow-internal"
    network            = "on-prem"
    description        = "all internal traffic within the network"
    direction          = "INGRESS"
    priority           = "1000"
    destination_ranges = []
    source_ranges      = ["192.168.0.0/16"]
    allow = [{
      protocol = "tcp"
      ports    = ["0-65535"]
    }]
    allow = [{
      protocol = "udp"
      ports    = ["0-65535"]
    }]
    allow = [{
      protocol = "icmp"
    }]
    deny = []
  },
  {
    name               = "on-prem-allow-ssh-icmp"
	network            = "on-prem"
    description        = "allow ssh, icmp from anywhere:"
    direction          = "INGRESS"
    priority           = "1000"
    destination_ranges = []
    source_ranges      = ["0.0.0.0/0"]
    allow = [{
      protocol = "tcp"
      ports    = ["22"]
    }]
    allow = [{
      protocol = "icmp"
    }]
      deny = []
  }
]
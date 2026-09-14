project_id    = "qwiklabs-gcp-02-fbced61ac208"
network_name  = "vpc-network-9zki"
machine_type  = "e2-standard-2"

instances = {
  "us-test-01" = {
  zone = "us-central1-b"
  subnetwork = "subnet-a-jqeh"
  }
  "us-test-02" = {
  zone = "us-east4-a"
  subnetwork = "subnet-b-0yde"
  }  
}

subnets = [
  {
    subnet_name   = "subnet-a-jqeh"
    subnet_ip     = "10.10.10.0/24"
    subnet_region = "us-central1"
    stack_type    = "IPV4_ONLY"
    description   = "subnet a"
  },
  {
    subnet_name   = "subnet-b-0yde"
    subnet_ip     = "10.10.20.0/24"
    subnet_region = "us-east4"
    stack_type    = "IPV4_ONLY"
    description   = "subnet b"
  }
]

rules = [{
  name               = "quqq-firewall-ssh"
  description        = "allow SSH"
  direction          = "INGRESS"
  priority           = "1000"
  destination_ranges = []
  source_ranges      = ["0.0.0.0/0"]
  allow = [{
    protocol = "tcp"
    ports    = ["22"]
  }]
  deny = []
  },
  {
    name               = "csza-firewall-rdp"
    description        = "Allow RDP"
    direction          = "INGRESS"
    priority           = "65535"
    destination_ranges = []
    source_ranges      = ["0.0.0.0/24"]
    allow = [{
      protocol = "tcp"
      ports    = ["3389"]
    }]
    deny = []
  },
  {
    name               = "ltrr-firewall-icmp"
    description        = null
    direction          = "INGRESS"
    priority           = "1000"
    destination_ranges = []
    source_ranges      = ["10.10.10.0/24", "10.10.20.0/24"]
    allow = [{
      protocol = "icmp"
    }]
    deny = []
}]
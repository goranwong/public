project_id = " "
vpcs = {
  "vpc-demo" = {
    network_name = "vpc-demo"

    subnets = [
      {
        subnet_name   = "vpc-demo-subnet1"
        subnet_ip     = "10.1.1.0/24"
        subnet_region = " "
        description   = "subnet 1 of VPC demo"
      },
      {
        subnet_name   = "vpc-demo-subnet2"
        subnet_ip     = "10.2.1.0/24"
        subnet_region = " "
        description   = "subnet 2 of VPC demo"
      }

    ]
  },
  "on-prem" = {
    network_name = "on-prem"
    subnets = [
      {
        subnet_name   = "on-prem-subnet1"
        subnet_ip     = "192.168.1.0/24"
        subnet_region = " "
        description   = "subnet 1 for on-prem"
      }
    ]
  }
}

vm_instances = {
  "vpc-demo-instance1" = {
    zone         = " "
    network_name = "vpc-demo"
    subnetwork   = "vpc-demo-subnet1"
  },
  "vpc-demo-instance2" = {
    zone         = " "
    network_name = "vpc-demo"
    subnetwork   = "vpc-demo-subnet2"
  },
  "on-prem-instance1" = {
    zone         = " "
    network_name = "on-prem"
    subnetwork   = "on-prem-subnet1"
  }
}

firewall_rules = {
  "vpc-demo-allow-internal" = {
    network       = "vpc-demo"
    description   = "all internal traffic within the network"
    source_ranges = ["10.0.0.0/8"]
    priority      = 1000
    allows = [
      { protocol = "tcp", ports = ["0-65535"] },
      { protocol = "udp", ports = ["0-65535"] },
      { protocol = "icmp", ports = [] }
    ]
  },
  "vpc-demo-allow-ssh-icmp" = {
    network       = "vpc-demo"
    description   = "allow ssh, icmp from anywhere"
    priority      = 1000
    source_ranges = ["0.0.0.0/0"]
    allows = [
      { protocol = "tcp", ports = ["22"] },
      { protocol = "icmp", ports = [] }
    ]
  },
  "on-prem-allow-internal" = {
    network       = "on-prem"
    description   = "all internal traffic within the network"
    source_ranges = ["192.168.0.0/16"]
    priority      = 1000
    allows = [
      { protocol = "tcp", ports = ["0-65535"] },
      { protocol = "udp", ports = ["0-65535"] },
      { protocol = "icmp", ports = [] }
    ]
  },
  "on-prem-allow-ssh-icmp" = {
    network       = "on-prem"
    description   = "allow ssh, icmp from anywhere"
    priority      = 1000
    source_ranges = ["192.168.0.0/16"]
    allows = [
      { protocol = "tcp", ports = ["22"] },
      { protocol = "icmp", ports = [] }
    ]
  }  
}


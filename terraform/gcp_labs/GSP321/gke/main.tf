# Read local state file from network (network)
data "terraform_remote_state" "network" {
  backend = "local"
  config = {
    path = "../network/terraform.tfstate"
  }
}


resource "google_container_cluster" "griffin_dev" {
  name     = "griffin-dev"
  location = local.zone

  network = module.griffin-dev-vpc.network_name
  subnetwork = module.griffin-dev-vpc.subnets_names[1]

  initial_node_count       = 2
  remove_default_node_pool = false

  node_config {
    machine_type = "e2-standard-4"

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  deletion_protection = false
}
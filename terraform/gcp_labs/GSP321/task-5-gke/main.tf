# Read local state file from network (network)
data "terraform_remote_state" "network" {
  backend = "local"
  config = {
    path = "../task-1-2-network/terraform.tfstate"
  }
}


resource "google_container_cluster" "griffin_dev" {
  name     = "griffin-dev"
  location = var.zone

  #network = module.griffin-dev-vpc.network_name
  #subnetwork = module.griffin-dev-vpc.dev_wp_subnet_name
  
  network    = data.terraform_remote_state.network.outputs.dev_network_name
  subnetwork = data.terraform_remote_state.network.outputs.dev_wp_subnet_name

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
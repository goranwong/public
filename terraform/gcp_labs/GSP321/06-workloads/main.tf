terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

data "terraform_remote_state" "gke" {
  backend = "local"
  config = {
    path = "../05-gke/terraform.tfstate"
  }
}

provider "kubernetes" {
  host                   = "https://${data.terraform_remote_state.gke.outputs.gke_endpoint}"
  cluster_ca_certificate = base64decode(data.terraform_remote_state.gke.outputs.cluster_ca_certificate)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "gke-gcloud-auth-plugin"
  }
}

resource "kubernetes_secret" "database" {
  metadata {
    name = "database"
  }
  data = {
    username = "wp_user"
    password = "stormwind_rules"
  }
}

#resource "kubernetes_persistent_volume_claim" "wp_pv_claim" {
#  metadata {
#    name = "wordpress-volumeclaim"
#  }
#  spec {
#    access_modes = ["ReadWriteOnce"]
#    resources {
#      requests = {
#        storage = "10Gi"
#      }
#    }
#  }
#}

resource "google_monitoring_uptime_check_config" "wordpress_uptime_check" {
  display_name = "wordpress-frontend-uptime-check"
  project      = var.project_id
  timeout      = "10s"
  period       = "60s"

  http_check {
    path         = "/"
    port         = "80"
    request_method = "GET"
    use_ssl      = false

    accepted_response_status_codes {
      status_value = 200
    }
  }

  monitored_resource {
    type = "uptime_url"
    labels = {
      project_id = var.project_id
      host       = var.wordpress_external_ip
    }
  }
}

variable "wordpress_external_ip" {
  type        = string
  description = "External IP address of the deployed WordPress service"
}
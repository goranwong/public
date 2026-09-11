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
  region  = var.region
}


# Define startup script data source

data "http" "startup_script" {
  url = "https://storage.googleapis.com/spls/gsp301/install-web.sh"
}

# Task 1. Create a storage bucket and copy the startup script

resource "google_storage_bucket" "lab_bucket" {
  name          = "${var.project_id}-gsp301"
  location      = var.region
  force_destroy = true
  
  uniform_bucket_level_access = true  
}

# Define startup script

resource "google_storage_bucket_object" "startup_script" {
  name          = "install-web.sh"
  bucket        = google_storage_bucket.lab_bucket.name
  content       = data.http.startup_script.response_body
}

# Task 2. Create a VM instance with a remote startup script

resource "google_compute_instance" "lab_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  metadata = {
    startup-script-url = "gs://${google_storage_bucket.lab_bucket.name}/${google_storage_bucket_object.startup_script.name}"
  }  
  network_interface { network = "default" }

  boot_disk {
    initialize_params {
      image = var.image
    }
  }
  
  tags = [var.instance_tag]    

 
}

# Task 3. Create a firewall rule to allow traffic (80/tcp)

resource "google_compute_firewall" "allow_http" {
  name    = "gsp301-allow-http"
  network = "default"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
 
 source_ranges = ["0.0.0.0/0"]
 tags = [var.instance_tag] 
}


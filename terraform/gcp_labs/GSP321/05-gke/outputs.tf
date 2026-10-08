output "gke_endpoint" {
  value = google_container_cluster.griffin_dev.endpoint
}

output "cluster_ca_certificate" {
  value     = google_container_cluster.griffin_dev.master_auth[0].cluster_ca_certificate
  sensitive = true
}

output "gke_cluster_name" {
  value = google_container_cluster.griffin_dev.name
}
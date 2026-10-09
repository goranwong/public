output "cloud_sql_proxy_sa_email" {
  description = "Email of the Cloud SQL Proxy Service Account"
  value       = google_service_account.cloud_sql_proxy.email
}
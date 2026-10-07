resource "google_service_account" "cloud_sql_proxy" {
  account_id   = "cloud-sql-proxy"
  display_name = "Cloud SQL Proxy SA"
}

resource "google_project_iam_member" "cloud_sql_proxy_role" {
  project = var.project_id
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:${google_service_account.cloud_sql_proxy.email}"
}

# Grant Editor Role to Additional Engineer
resource "google_project_iam_member" "engineer_editor" {
  project = var.project_id
  role    = "roles/editor"
  member  = "user:${var.student2_email}"
}
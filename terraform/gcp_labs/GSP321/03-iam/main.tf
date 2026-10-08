# Grant Editor Role to Additional Engineer
resource "google_project_iam_member" "engineer_editor" {
  project = var.project_id
  role    = "roles/editor"
  member  = "user:${var.student2_email}"
}
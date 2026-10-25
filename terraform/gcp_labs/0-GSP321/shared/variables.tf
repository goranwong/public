variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
}

variable "zone" {
  description = "GCP Zone"
  type        = string
}

variable "db_password" {
  type        = string
  description = "Database user password"
  sensitive   = true
}

variable "student2_email" {
  description = "Email address for the second student/engineer"
  type        = string
}
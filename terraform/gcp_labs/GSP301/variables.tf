variable "project_id" {
  type        = string
  description = "The GCP Project ID"
}

variable "zone" {
  type        = string
  description = "The zone to deploy the instance in"
}

variable "region" {
  type        = string
  description = "The zone to deploy the instance in"
}

variable "instance_name" {
  type        = string
  description = "The name of the VM instance"
}

variable "instance_tag" {
  type        = string
  description = "tag of the VM instance"
}

variable "machine_type" {
  type        = string
  description = "The machine type for the VM"
  default     = "e2-medium"
}

variable "image" {
  type        = string
  description = "The boot image for the OS"
  default     = "debian-12"
}


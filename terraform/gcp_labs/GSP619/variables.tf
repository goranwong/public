variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region1" {
  description = "GCP Region 1"
  type        = string
}

variable "zone1" {
  description = "GCP Zone 1"
  type        = string
}

variable "region2" {
  description = "GCP Region 2"
  type        = string
}

variable "zone2" {
  description = "GCP Zone 2"
  type        = string
}

variable "machine_type" {
  type        = string
  description = "The machine type for the VM"
  default     = "e2-medium"
}

variable "image" {
  type        = string
  description = "The boot image for the OS"
  default     = "debian-cloud/debian-12"
}


variable "vpcs" {
  type = map(object({
    network_name = string
    subnets = list(object({
      subnet_name   = string
      subnet_ip     = string
      subnet_region = string
      description   = string
    }))
  }))
}

variable "instances" {
  type = map(object({
    zone         = string
    subnetwork   = string
	machine_type = string
	image        = string
  }))
  description = "Map of instances with their respective zones and subnets"
}
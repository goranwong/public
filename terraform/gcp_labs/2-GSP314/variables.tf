variable "project_id" {
  type        = string
  description = "The GCP Project ID"
}

variable "instances" {
  type = map(object({
    zone       = string
	subnetwork = string
	}))
  description = "list of VM instance definition for the VM module"
}

variable "network_name" {
  type        = string
  description = "network name of VPC"
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

variable "subnets" {
  type        = list(map(string))
  description = "list of subnet definitions for the VPC module"
  default = []
}

variable "rules" {
  type = list(object({
    name                    = string
    description             = optional(string, null)
    direction               = optional(string, "INGRESS")
    priority                = optional(number, 1000)
    ranges                  = optional(list(string), [])
    source_ranges           = optional(list(string), [])
    destination_ranges      = optional(list(string), [])
    source_tags             = optional(list(string), null)
    target_tags             = optional(list(string), null)
    source_service_accounts = optional(list(string), null)
    target_service_accounts = optional(list(string), null)
    allow = optional(list(object({
      protocol = string
      ports    = optional(list(string), [])
    })), [])
    deny = optional(list(object({
      protocol = string
      ports    = optional(list(string), [])
    })), [])
  }))
  description = "List of firewall rules definitions"
  default     = []
}
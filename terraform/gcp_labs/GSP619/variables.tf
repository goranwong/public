variable "project_id" {
  description = "GCP Project ID"
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

variable "vm_instances" {
  type = map(object({
    machine_type = string
    image        = string
  }))
  description = "Map of instances with their respective zones and subnets"
}

variable "rules" {
  type = list(object({
    name                    = string
	network                 = string
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

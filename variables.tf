variable "publisher_name" {
  description = "Netskope Publisher Name"
  type        = string
}

variable "project" {
  description = "GCP Project ID"
  type        = string
}

variable "machine_type" {
  description = "GCP Machine Type - e2-medium is the reccomended instance size."
  default     = "e2-medium"
  type        = string
}

variable "zone" {
  description = "GCP Zne"
  type        = string
}

variable "network_interface" {
  description = "GCP Network Interface"
  type        = string
}



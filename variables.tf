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
  description = "GCP Zone"
  type        = string
}

variable "network_interface" {
  description = "GCP Network Interface"
  type        = string
}

variable "block_project_ssh_keys" {
  description = "Block Project SSH Keys"
  default     = true
  type        = bool
}

variable "associate_public_ip_address" {
  description = "Publisher Assigned Public IP or Not"
  type        = bool
  default     = true
}

variable "ssh_user" {
  description = "SSH User"
  type        = string
  default     = "ubuntu"
}

variable "public_key" {
    description = "Public Key String"
    type        = string
    default     = "AAAABBBBCCCC.."
  
}





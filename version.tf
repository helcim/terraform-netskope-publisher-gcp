terraform {
  required_providers {
    netskope = {
      version = ">= 0.2.1"
      source  = "netskopeoss/netskope"
    }
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0"
    }
  }
  required_version = ">= 1.1.7"
}
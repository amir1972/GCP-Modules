terraform {
  # This module is now only being tested with Terraform 1.0.x. However, to make upgrading easier, we are setting
  # 0.12.26 as the minimum version, as that version added support for required_providers with source URLs, making it
  # forwards compatible with 1.0.x code.
  required_version = ">= 0.12.26"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.43.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 3.43.0"
    }
  }
}

# ------------------------------------------------------------------------------
# CONFIGURE OUR GCP CONNECTION
# ------------------------------------------------------------------------------

provider "google" {
  region  = var.region
  project = var.project
  credentials = file("tvvars.json")
}

provider "google-beta" {
  region  = var.region
  project = var.project
  credentials = file("tvvars.json")
}


# ------------------------------------------------------------------------------
# CREATE THE INTERNAL TCP LOAD BALANCER
# ------------------------------------------------------------------------------

module "lb" {
  
  source = "../modules/internal-load-balancer"

  name    = var.name
  region  = var.region
  project = var.project
  zone    = var.zone

  backends = [
    {
      description = "Instance group for internal-load-balancer test"
      group       = "projects/helpful-pixel-321822/zones/asia-south1-c/instanceGroups/instance-group-1"
    },
  ]

  # This setting will enable internal DNS for the load balancer
  service_label = var.name

  network    = var.network # we can read this value from vpc module module.vpc_network.network
  subnetwork = var.subnetwork # we can read this value from vpc module module.vpc_network.public_subnetwork 

  health_check_port = 5000
  http_health_check = false
  target_tags       = [var.name]
  source_tags       = [var.name]
  ports             = ["5000"]

  custom_labels = var.custom_labels
}
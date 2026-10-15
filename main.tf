terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.10"
    }
  }
}

# Sustituir por el ID real del proyecto antes de ejecutar plan.
variable "project_id" {
  description = "ID del proyecto de Google Cloud"
  type        = string
  default     = "REEMPLAZAR_POR_PROJECT_ID"
}

provider "google" {
  project = var.project_id
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "eventflow_vpc" {
  name                    = "eventflow-vpc"
  auto_create_subnetworks = true
}

resource "google_compute_firewall" "allow_http" {
  name    = "eventflow-allow-http"
  network = google_compute_network.eventflow_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  # Demostración académica: restringir en producción a rangos necesarios.
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance" "web_server" {
  name         = "eventflow-web-server"
  machine_type = "e2-micro"
  zone         = "us-central1-c"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.eventflow_vpc.name
    access_config {}
  }

  tags = ["eventflow-web"]
}

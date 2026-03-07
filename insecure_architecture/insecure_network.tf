# Cloud VPC (simulated cloud workload environment)

resource "google_compute_network" "insecure_vpc" {
  name                    = "insecure-cloud-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "insecure_subnet" {
  name          = "insecure-subnet"
  ip_cidr_range = "10.10.0.0/24"
  region        = "us-central1"
  network       = google_compute_network.insecure_vpc.id

  description = "Subnet for insecure cloud workloads"
}


# Simulated On-Premises VPC

resource "google_compute_network" "onprem_vpc" {
  name                    = "onprem-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "onprem_subnet" {
  name          = "onprem-subnet"
  ip_cidr_range = "10.20.0.0/24"
  region        = "us-central1"
  network       = google_compute_network.onprem_vpc.id

  description = "Subnet representing on-prem environment"
}
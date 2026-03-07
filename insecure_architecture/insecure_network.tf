# Insecure Cloud VPC
resource "google_compute_network" "cloud_vpc" {
  name                    = "insecure-cloud-vpc"
  auto_create_subnetworks = true
}

# Simulated On-Prem VPC
resource "google_compute_network" "onprem_vpc" {
  name                    = "insecure-onprem-vpc"
  auto_create_subnetworks = true
}
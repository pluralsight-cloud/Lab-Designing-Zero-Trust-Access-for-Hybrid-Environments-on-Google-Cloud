# Cloud VPC (simulated cloud workload environment)

resource "google_compute_network" "lab_vpc" {
  name                    = "lab-cloud-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "lab_subnet" {
  name          = "lab-subnet"
  ip_cidr_range = "10.10.0.0/24"
  region        = "us-central1"
  network       = google_compute_network.lab_vpc.id

  #TODO
  #uncomment the following line of code.
  #private_ip_google_access = true

  description = "Subnet for cloud workloads"
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
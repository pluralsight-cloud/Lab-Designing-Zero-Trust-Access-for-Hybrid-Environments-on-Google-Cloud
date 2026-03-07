resource "google_compute_network" "secure_vpc" {

  name                    = "secure-cloud-vpc"
  auto_create_subnetworks = false
}


resource "google_compute_subnetwork" "secure_subnet" {

  name          = "secure-subnet"
  ip_cidr_range = "10.30.0.0/24"
  region        = "us-central1"

  network = google_compute_network.secure_vpc.id

  private_ip_google_access = true

  description = "Private subnet used for Zero Trust workloads"
}
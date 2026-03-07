resource "google_compute_network" "insecure_vpc" {
  name                    = "insecure-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "insecure_subnet" {
  name          = "insecure-subnet"
  ip_cidr_range = "10.20.0.0/24"
  region        = "us-central1"
  network       = google_compute_network.insecure_vpc.id

  depends_on = [google_compute_network.insecure_vpc]
}
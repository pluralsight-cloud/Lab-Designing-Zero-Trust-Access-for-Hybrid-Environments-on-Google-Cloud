# Create secure VPC
resource "google_compute_network" "secure_vpc" {
  name                    = "secure-cloud-vpc"
  auto_create_subnetworks = false
  labels = {
    env  = "lab"
    type = "zero-trust"
  }
}

# Create a subnet inside the VPC
resource "google_compute_subnetwork" "secure_subnet" {
  name                     = "secure-subnet"
  ip_cidr_range            = "10.10.0.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.secure_vpc.id
  private_ip_google_access = true

  depends_on = [google_compute_network.secure_vpc]
}
# Secure VPC

resource "google_compute_network" "secure_vpc" {

  name                    = "secure-cloud-vpc"
  auto_create_subnetworks = true

}
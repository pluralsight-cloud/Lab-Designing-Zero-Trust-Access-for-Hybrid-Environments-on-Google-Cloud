resource "google_compute_instance" "secure_vm" {

  name         = "secure-private-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  tags = ["iap-ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {

    network    = google_compute_network.secure_vpc.id
    subnetwork = google_compute_subnetwork.secure_subnet.id

    # NO PUBLIC IP
  }

  metadata = {
    enable-oslogin = "TRUE"
  }

  labels = {
    environment = "zero-trust"
  }
}
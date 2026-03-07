# Secure VM with NO public IP

resource "google_compute_instance" "secure_vm" {

  name         = "secure-private-vm"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {

    network = google_compute_network.secure_vpc.id

    # No access_config → no public IP
  }

  metadata = {
    enable-oslogin = "TRUE"
  }

}
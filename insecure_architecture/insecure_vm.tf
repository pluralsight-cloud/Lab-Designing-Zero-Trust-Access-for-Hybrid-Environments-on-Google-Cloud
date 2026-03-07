# Cloud VM exposed to the internet

resource "google_compute_instance" "cloud_vm" {

  name         = "insecure-cloud-vm"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = google_compute_network.cloud_vpc.id

    # PUBLIC IP → major security exposure
    access_config {}
  }

}

# Simulated On-Prem VM also exposed

resource "google_compute_instance" "onprem_vm" {

  name         = "insecure-onprem-vm"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = google_compute_network.onprem_vpc.id

    # Public IP again
    access_config {}
  }

}
# Cloud VM exposed to the internet

resource "google_compute_instance" "insecure_vm" {
  name         = "insecure-cloud-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = google_compute_network.insecure_vpc.id
    subnetwork = google_compute_subnetwork.insecure_subnet.id
    # Assign public IP
    access_config {}
  }

  metadata = {
    enable-oslogin = "TRUE"
  }

  depends_on = [
    google_compute_network.insecure_vpc,
    google_compute_subnetwork.insecure_subnet,
    google_compute_firewall.allow_ssh_insecure
  ]
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
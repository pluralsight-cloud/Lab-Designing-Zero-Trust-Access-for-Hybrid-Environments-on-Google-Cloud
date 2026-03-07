resource "google_compute_instance" "secure_vm" {
  name         = "secure-private-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-b"

  tags = ["iap-ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = google_compute_network.secure_vpc.id
    subnetwork = google_compute_subnetwork.secure_subnet.id
  }

  metadata = {
    enable-oslogin = "TRUE"
  }

  # Ensure VM is destroyed before firewall/network
  depends_on = [
    google_compute_network.secure_vpc,
    google_compute_subnetwork.secure_subnet,
    google_compute_firewall.allow_iap_ssh,
    google_compute_firewall.deny_all_ingress
  ]
}
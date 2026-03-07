# Allow SSH only from Google IAP

resource "google_compute_firewall" "allow_iap_ssh" {

  name    = "allow-ssh-from-iap"
  network = google_compute_network.secure_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["35.235.240.0/20"]

  target_tags = ["iap-ssh"]

  description = "Allow SSH access only via Identity-Aware Proxy"
}
# Default deny rule

resource "google_compute_firewall" "deny_all_ingress" {

  name    = "deny-all-ingress"
  network = google_compute_network.secure_vpc.name

  direction = "INGRESS"

  deny {
    protocol = "all"
  }

  source_ranges = ["0.0.0.0/0"]

}

# Allow SSH ONLY from IAP

resource "google_compute_firewall" "allow_iap_ssh" {

  name    = "allow-ssh-from-iap"
  network = google_compute_network.secure_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # Google IAP TCP forwarding range
  source_ranges = ["35.235.240.0/20"]

  description = "Zero Trust SSH access via IAP only"

}
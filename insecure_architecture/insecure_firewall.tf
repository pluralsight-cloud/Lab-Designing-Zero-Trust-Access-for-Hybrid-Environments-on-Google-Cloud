# This firewall rule is intentionally insecure.
# It allows SSH from ANYWHERE on the internet.

resource "google_compute_firewall" "allow_ssh_anywhere" {

  name    = "allow-ssh-from-internet"
  network = google_compute_network.cloud_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # Critical security flaw
  source_ranges = ["0.0.0.0/0"]

  description = "INSECURE: Allows SSH from the entire internet"
}
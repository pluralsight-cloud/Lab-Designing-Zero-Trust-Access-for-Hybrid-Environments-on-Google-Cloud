# This firewall rule is intentionally insecure.
# It allows SSH from ANYWHERE on the internet.

# Open SSH to internet
resource "google_compute_firewall" "allow_ssh_insecure" {
  name    = "allow-ssh-from-internet"
  network = google_compute_network.insecure_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]

  depends_on = [google_compute_network.insecure_vpc]
}
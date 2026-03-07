# 01_insecure_architecture/insecure_firewall.tf

# Cloud VM open to Internet
resource "google_compute_firewall" "allow_ssh_insecure" {
  name    = "allow-ssh-from-internet"
  network = google_compute_network.insecure_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# On-prem VM open to Internet
resource "google_compute_firewall" "allow_ssh_onprem" {
  name    = "allow-ssh-onprem"
  network = google_compute_network.onprem_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}
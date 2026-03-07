# SSH open to the entire internet (Intentional security flaw)

resource "google_compute_firewall" "allow_ssh_insecure" {
  name    = "allow-ssh-from-internet"
  network = google_compute_network.insecure_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = ["ssh-open"]

  description = "Insecure firewall rule allowing SSH from anywhere"
}


# On-prem VM also exposed to internet

resource "google_compute_firewall" "allow_ssh_onprem" {
  name    = "allow-ssh-onprem-internet"
  network = google_compute_network.onprem_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = ["ssh-open"]

  description = "On-prem SSH exposed to internet"
}
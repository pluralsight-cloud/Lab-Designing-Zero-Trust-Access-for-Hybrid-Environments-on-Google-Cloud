# TODO:
# Replace the resource in the below code "allow_ssh_insecure" to "allow-only-iap"
# Replace the ame in the below code "allow-ssh-from-internet" to "allow-only-from-iap"

resource "google_compute_firewall" "allow_ssh_insecure" {
  name    = "allow-ssh-from-internet"
  network = google_compute_network.lab_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  
  # TODO:
  # Replace the open internet range with the Google IAP range
  # Hint: Identity-Aware Proxy IP range = 35.235.240.0/20 
  source_ranges = ["0.0.0.0/0"]

  # TODO:
  # Change the target tag from "ssh-open" to "iap-ssh".
  # to VMs that allow IAP SSH access

  target_tags = ["ssh-open"]

  description = "firewall rule allowing SSH everywhere then trasforming to allow-only-IAP"
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
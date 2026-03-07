# Cloud VM
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
    access_config {} # public IP
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

# On-prem VM
resource "google_compute_instance" "onprem_vm" {
  name         = "onprem-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = google_compute_network.onprem_vpc.id
    subnetwork = google_compute_subnetwork.onprem_subnet.id
    access_config {} # public IP
  }

  metadata = {
    enable-oslogin = "TRUE"
  }

  depends_on = [
    google_compute_network.onprem_vpc,
    google_compute_subnetwork.onprem_subnet,
    google_compute_firewall.allow_ssh_onprem
  ]
}
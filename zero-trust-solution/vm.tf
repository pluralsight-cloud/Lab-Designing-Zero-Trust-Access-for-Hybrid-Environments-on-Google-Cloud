# Cloud VM with public IP

resource "google_compute_instance" "cloud_vm" {

  name         = "cloud-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"


  # TODO:
  # Change the target tag from "ssh-open" to "iap-ssh".
  # to VMs that allow IAP SSH access

  tags = ["ssh-open"]  

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {

    network    = google_compute_network.lab_vpc.id
    subnetwork = google_compute_subnetwork.lab_subnet.id
    
    # TODO:
    # Remove this block to prevent the VM from receiving a public IP
    # This will convert the VM into a private instance
    access_config {} # PUBLIC IP
  }

  metadata = {
    enable-oslogin = "TRUE"
  }

  labels = {
    environment = "zero-trust-architecture"
  }
}


# Simulated On-Prem VM

resource "google_compute_instance" "onprem_vm" {

  name         = "onprem-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  tags = ["ssh-open"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {

    network    = google_compute_network.onprem_vpc.id
    subnetwork = google_compute_subnetwork.onprem_subnet.id

    access_config {} # PUBLIC IP
  }

  metadata = {
    enable-oslogin = "TRUE"
  }

  labels = {
    environment = "onprem"
  }
}
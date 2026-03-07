output "secure_vm_name" {

  description = "Private VM accessed through IAP"

  value = google_compute_instance.secure_vm.name
}

output "secure_vpc" {

  description = "Zero Trust VPC network"

  value = google_compute_network.secure_vpc.name
}
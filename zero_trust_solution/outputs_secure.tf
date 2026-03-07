output "secure_vm_name" {

  description = "Name of the secure private VM"

  value = google_compute_instance.secure_vm.name

}

output "secure_network" {

  description = "Secure VPC network"

  value = google_compute_network.secure_vpc.name

}
output "secure_vm_name" {
  value = google_compute_instance.secure_vm.name
}

output "secure_vm_network" {
  value = google_compute_subnetwork.secure_subnet.name
}
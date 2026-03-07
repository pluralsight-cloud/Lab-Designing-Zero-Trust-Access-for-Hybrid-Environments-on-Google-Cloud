output "cloud_vm_external_ip" {
  description = "Public IP of insecure cloud VM"
  value       = google_compute_instance.insecure_vm.network_interface[0].access_config[0].nat_ip
}

output "onprem_vm_external_ip" {
  description = "Public IP of simulated on-prem VM"
  value       = google_compute_instance.onprem_vm.network_interface[0].access_config[0].nat_ip
}
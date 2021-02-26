output "prajith-public-ip" {
value = google_compute_instance.my_vm.*.network_interface.0.access_config 
}

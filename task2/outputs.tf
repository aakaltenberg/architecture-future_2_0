output "instance_id" {
  description = "ID виртуальной машины"
  value       = yandex_compute_instance.vm.id
}

output "instance_ip" {
  description = "Публичный IP-адрес"
  value       = yandex_compute_instance.vm.network_interface.0.nat_ip_address
}

output "instance_name" {
  description = "Имя ВМ"
  value       = yandex_compute_instance.vm.name
}
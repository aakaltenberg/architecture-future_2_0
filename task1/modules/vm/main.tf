terraform {
  required_version = ">= 1.0"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.90"
    }
  }
}

resource "yandex_compute_disk" "additional" {
  name = "${var.vm_name}-data"
  size = var.disk_size
  type = var.disk_type
  zone = var.zone
}

resource "yandex_compute_instance" "this" {
  name        = var.vm_name
  zone        = var.zone
  platform_id = var.platform_id

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.boot_disk_size
      type     = var.boot_disk_type
    }
  }

  secondary_disk {
    disk_id     = yandex_compute_disk.additional.id
    device_name = "data"
    mode        = "READ_WRITE"
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = var.assign_public_ip
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${var.ssh_key}"
  }
}
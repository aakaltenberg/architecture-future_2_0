terraform {
  required_version = ">= 1.0"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.90"
    }
  }

  # Удалённое состояние в Yandex Object Storage (S3-совместимый)
  backend "s3" {
    endpoint                    = "storage.yandexcloud.net"
    bucket                      = "terraform-state-bucket"
    key                         = "task2/terraform.tfstate"
    region                      = "ru-central1"
    skip_region_validation      = true
    skip_credentials_validation = true
    # access_key и secret_key будут переданы через переменные окружения
    # AWS_ACCESS_KEY_ID и AWS_SECRET_ACCESS_KEY
  }
}

provider "yandex" {
  token     = var.yc_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
}

# виртуальная машина
resource "yandex_compute_instance" "vm" {
  name        = var.vm_name
  zone        = var.zone
  platform_id = "standard-v2"

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.boot_disk_size
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = var.assign_public_ip
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${var.ssh_key}"
  }
}
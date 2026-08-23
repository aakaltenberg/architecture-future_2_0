terraform {
  required_version = ">= 1.0"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.90"
    }
  }
}

provider "yandex" {
  token     = var.yc_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
}

module "vm" {
  source = "../../modules/vm"

  vm_name          = var.vm_name
  zone             = var.zone
  image_id         = var.image_id
  cores            = var.cores
  memory           = var.memory
  boot_disk_size   = var.boot_disk_size
  disk_size        = var.disk_size
  subnet_id        = var.subnet_id
  ssh_key          = var.ssh_key
  ssh_user         = var.ssh_user
  assign_public_ip = var.assign_public_ip
}
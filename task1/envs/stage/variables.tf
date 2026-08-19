variable "yc_token" {
  description = "OAuth-токен Yandex Cloud"
  type        = string
  sensitive   = true
  default     = null
}

variable "yc_cloud_id" {
  description = "ID облака Yandex Cloud"
  type        = string
  default     = null
}

variable "yc_folder_id" {
  description = "ID каталога Yandex Cloud"
  type        = string
  default     = null
}

variable "vm_name" {
  description = "Имя ВМ"
  type        = string
}

variable "zone" {
  description = "Зона размещения"
  type        = string
}

variable "image_id" {
  description = "ID образа"
  type        = string
}

variable "cores" {
  description = "Количество ядер"
  type        = number
}

variable "memory" {
  description = "RAM, ГБ"
  type        = number
}

variable "boot_disk_size" {
  description = "Размер boot-диска, ГБ"
  type        = number
}

variable "disk_size" {
  description = "Размер дополнительного диска, ГБ"
  type        = number
}

variable "subnet_id" {
  description = "ID подсети"
  type        = string
}

variable "ssh_key" {
  description = "Публичный SSH-ключ"
  type        = string
}

variable "ssh_user" {
  description = "SSH-пользователь"
  type        = string
  default     = "ubuntu"
}

variable "assign_public_ip" {
  description = "Назначить публичный IP"
  type        = bool
  default     = true
}
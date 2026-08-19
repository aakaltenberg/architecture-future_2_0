variable "yc_token" {
  description = "OAuth-токен Yandex Cloud"
  type        = string
  sensitive   = true
  default     = null
}

variable "yc_cloud_id" {
  description = "ID облака Yandex Cloud"
  type        = string
}

variable "yc_folder_id" {
  description = "ID каталога Yandex Cloud"
  type        = string
}

variable "vm_name" {
  description = "Имя ВМ"
  type        = string
}

variable "zone" {
  description = "Зона размещения"
  type        = string
  default     = "ru-central1-a"
}

variable "image_id" {
  description = "ID образа (Ubuntu, CentOS и т.п.)"
  type        = string
}

variable "cores" {
  description = "Количество ядер CPU"
  type        = number
}

variable "memory" {
  description = "Объём RAM в ГБ"
  type        = number
}

variable "boot_disk_size" {
  description = "Размер загрузочного диска, ГБ"
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
  description = "Пользователь SSH"
  type        = string
  default     = "ubuntu"
}

variable "assign_public_ip" {
  description = "Назначить ли публичный IP"
  type        = bool
  default     = true
}
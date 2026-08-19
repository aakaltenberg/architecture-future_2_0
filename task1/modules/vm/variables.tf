variable "vm_name" {
  description = "Имя виртуальной машины"
  type        = string
}

variable "zone" {
  description = "Зона размещения ВМ"
  type        = string
}

variable "image_id" {
  description = "ID образа загрузочного диска"
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
  description = "Размер загрузочного диска в ГБ"
  type        = number
}

variable "boot_disk_type" {
  description = "Тип загрузочного диска"
  type        = string
  default     = "network-ssd"
}

variable "disk_size" {
  description = "Размер дополнительного подключаемого диска в ГБ"
  type        = number
}

variable "disk_type" {
  description = "Тип дополнительного диска"
  type        = string
  default     = "network-ssd"
}

variable "subnet_id" {
  description = "ID подсети, к которой будет подключена ВМ"
  type        = string
}

variable "ssh_key" {
  description = "Публичный SSH-ключ"
  type        = string
}

variable "ssh_user" {
  description = "Пользователь, которому будет добавлен SSH-ключ"
  type        = string
  default     = "ubuntu"
}

variable "assign_public_ip" {
  description = "Назначить ли публичный IP-адрес"
  type        = bool
  default     = true
}

variable "platform_id" {
  description = "Платформа ВМ (standard-v1, standard-v2, standard-v3)"
  type        = string
  default     = "standard-v2"
}
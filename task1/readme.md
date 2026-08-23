# Task1 — Terraform-модуль для создания ВМ

Универсальный модуль `modules/vm` создаёт в Yandex Cloud виртуальную машину с:
- заданным количеством CPU и объёмом RAM;
- загрузочным диском;
- дополнительным подключаемым диском;
- подключением к указанной подсети;
- SSH-ключом.

## Параметры модуля

| Переменная        | Тип    | Описание                                   | По умолчанию |
|-------------------|--------|--------------------------------------------|--------------|
| vm_name           | string | Имя ВМ                                     | —            |
| zone              | string | Зона размещения                            | —            |
| image_id          | string | ID образа загрузочного диска               | —            |
| cores             | number | Количество CPU                             | —            |
| memory            | number | Объём RAM, ГБ                              | —            |
| boot_disk_size    | number | Размер загрузочного диска, ГБ              | —            |
| boot_disk_type    | string | Тип загрузочного диска                     | network-ssd  |
| disk_size         | number | Размер дополнительного диска, ГБ           | —            |
| disk_type         | string | Тип дополнительного диска                  | network-ssd  |
| subnet_id         | string | ID подсети                                 | —            |
| ssh_key           | string | Публичный SSH-ключ                         | —            |
| ssh_user          | string | Пользователь SSH                           | ubuntu       |
| assign_public_ip  | bool   | Назначить публичный IP                     | true         |
| platform_id       | string | Платформа ВМ                               | standard-v2  |

## Outputs

| Output             | Описание                     |
|--------------------|------------------------------|
| instance_id        | ID виртуальной машины        |
| instance_ip        | Публичный IP-адрес           |
| instance_name      | Имя ВМ                       |
| boot_disk_id       | ID загрузочного диска        |
| additional_disk_id | ID дополнительного диска     |

## Запуск окружения (dev)

```bash
cd envs/dev
export YC_TOKEN="yc_токен"
terraform init
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

Аналогично выполняется запуск stage, prod окружения

*вместо terraform.tfvars в репозиторий добавлен terraform.tfvars.example. При реальном запуске, необходимо создать terraform.tfvars и заполнить недостающие идентификаторы реальными значениями (yc_cloud_id, yc_folder_id, image_id, subnet_id, ssh_key).

*для работы необходим включенный ВПН
# Task2 – Terraform с удалённым состоянием и CI/CD

Данная директория содержит Terraform-конфигурацию для развёртывания виртуальной машины в Yandex Cloud.
Состояние хранится **удалённо** в Yandex Object Storage (S3-совместимый), что обеспечивает командную работу и безопасность.

## Требования

- Учётная запись Yandex Cloud
- Созданный бакет в Object Storage
- Статические ключи доступа для Object Storage (Access Key и Secret Key)
- OAuth-токен для доступа к Yandex Cloud API
- GitHub Actions CI/CD

## Настройка backend

В файле `main.tf` прописан блок `backend "s3"` со следующими параметрами:

- `endpoint = "storage.yandexcloud.net"`
- `bucket = "kaa-terraform-state-bucket"`
- `key = "task2/terraform.tfstate"`

Для аутентификации в Object Storage при выполнении `terraform init` необходимо передать
`access_key` и `secret_key` через переменные окружения `AWS_ACCESS_KEY_ID` и `AWS_SECRET_ACCESS_KEY`.

## CI/CD Pipeline (GitHub Actions)

Workflow находится в `.github/workflows/terraform.yml`.

- **validate** – выполняется при push и pull request, проверяет синтаксис.
- **plan** – создаёт план изменений и сохраняет его как артефакт.
- **apply** – применяет план; запускается вручную через workflow_dispatch или после подтверждения в environment production.

Секреты заданы через секреты репозитория GitHub

## Локальный запуск

1. Необходимо скопировать `terraform.tfvars.example` в `terraform.tfvars` и заполнить реальными значениями.
2. Экспортировать переменные окружения:

```bash
export YC_TOKEN="yc_oauth_токен"
export AWS_ACCESS_KEY_ID="access_key"
export AWS_SECRET_ACCESS_KEY="secret_key"
```
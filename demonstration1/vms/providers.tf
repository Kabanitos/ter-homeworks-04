terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.9.5"
}

provider "yandex" {
  # token                    = "do not use!!!"
  cloud_id                 = var.varprovider.cloud_id
  folder_id                = var.varprovider.folder_id
  service_account_key_file = file("~/authorized_key.json")
  zone                     = var.varprovider.zone
}

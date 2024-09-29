terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.9.5"
}


resource "yandex_vpc_network" "test" {
  name = var.env_name
}

#создаем подсеть
resource "yandex_vpc_subnet" "sub-test" {
  name           = "${var.env_name}-${var.zone}"
  zone           = var.zone
  network_id     = yandex_vpc_network.test.id
  v4_cidr_blocks = [var.cidr_block]
}
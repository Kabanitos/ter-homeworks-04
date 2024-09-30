module "network" {
  source = "./module/network"
  zone = var.varprovider.zone
  env_name       = var.test-vm.env_name
  cidr_block = var.vpc_sub.v4_cidr_blocks
}



module "test-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.test-vm.env_name
  network_id     = module.network.vpc_id
  subnet_zones   = [var.varprovider.zone]
  subnet_ids     = [module.network.subnet_id]
  instance_name  = var.test-vm.instance_name
  image_family   = var.os
  public_ip      = var.test-vm.public_ip

  labels = {
    project = "marketing"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered#Для демонстрации №3
    serial-port-enable = 1
  }

}

module "example-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.example-vm.env_name
  network_id     = module.network.vpc_id
  subnet_zones   = [var.varprovider.zone]
  subnet_ids     = [module.network.subnet_id]
  instance_name  = var.example-vm.instance_name
  image_family   = var.os
  public_ip      = var.example-vm.public_ip

  labels = {
    project = "analytics"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    ssh_public_key = file(var.public_key)
    username       = var.username-init
  }

}


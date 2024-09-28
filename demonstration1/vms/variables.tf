###cloud vars

variable "public_key" {
  type    = string
  default = "~/.ssh/id_ed25519.pub"
}
variable "varprovider" {
  type = object({
    token     = string
    zone      = string
    cloud_id  = string
    folder_id = string
  })
  default = {
    token     = "default_token"
    zone      = "default_zone"
    cloud_id  = "default_cloud_id"
    folder_id = "default_folder_id"
  }
}

variable "username-init" {
  type    = string
  default = "ubuntu"
}

variable "vpc" {
  type = string
  default = "develop"
  
}

variable "os" {
  type = string
  default = "ubuntu-2004-lts"
  
}


variable "test-vm" {
  type = object({
    env_name = string
    instance_name = string
    public_ip = bool
  })
  default = {
    env_name = "develop"
    instance_name = "webs"
    public_ip = true
  }
  
}


variable "example-vm" {
   type = object({
    env_name = string
    instance_name = string
    public_ip = bool
  })
  default = {
    env_name = "stage"
    instance_name = "web-stage"
    public_ip = true
  }
}

variable "vpc_sub" {
  type = object({
    name = string
    v4_cidr_blocks = string
  })
  default = {
    name = "develop-ru-central1-a"
    v4_cidr_blocks = "10.0.1.0/24"
  }
}

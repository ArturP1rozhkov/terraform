module "vpc_dev" {
  source   = "./vpc"
  env_name = "develop"
  subnets = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
    { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
  ]
}


# module "vpc_prod" {
#  source   = "./vpc"
#  env_name = "production"
#  subnets = [
#    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
#    { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
#    { zone = "ru-central1-d", cidr = "10.0.3.0/24" },
#  ]
#}

locals {
  ssh_key = file("~/.ssh/id_ed25519.pub")
}

data "template_file" "cloudinit" {
  template = file("${path.module}/cloud-init.yml")
  vars = {
    ssh_keys = trimspace(local.ssh_key)
  }
}

module "marketing_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "develop"
  network_id     = module.vpc_dev.network_id
  subnet_zones   = [var.default_zone]
  subnet_ids = [module.vpc_dev.subnets["ru-central1-a"].id]
  instance_name  = "marketing"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = false

  labels = {
    owner   = "team-marketing"
    project = "marketing!"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}

module "analytics_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "develop"
  network_id     = module.vpc_dev.network_id
  subnet_zones   = [var.default_zone]
  subnet_ids = [module.vpc_dev.subnets["ru-central1-a"].id]
  instance_name  = "analytics"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = false

  labels = {
    owner   = "team-analytics"
    project = "analytics"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}
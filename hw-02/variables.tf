###cloud vars

variable "cloud_id" {
  type        = string
  default     = "b1g3g3a6ro9rr9hd0mvm"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1grsjmidldjs2rmkgd0"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

###ssh vars
variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICGCxz6Ttx4jaiMvpdANwl4va+6RTIWd+Vd8ylDNu1xD vboxuser@KVA"
  description = "ssh-keygen -t ed25519"
}

### env_var
variable "env" {
  type        = string
  default     = "dev"
  description = "Environment (dev, stage, prod)"
}

### vms_resources vars

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))

  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }

  description = "Compute resources VM web and db"
}


### metadata var

variable "metadata" {
  type = object({
    serial-port-enable = number
    ssh-keys           = string
  })

  default = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICGCxz6Ttx4jaiMvpdANwl4va+6RTIWd+Vd8ylDNu1xD vboxuser@KVA"
  }

  description = "Common metadata for all VMs"
}
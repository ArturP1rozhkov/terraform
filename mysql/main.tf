terraform {
  required_version = "~>1.15.0"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
    }
  }
}

provider "docker" {
  host = var.docker_host

}

variable "docker_host" {
  type        = string
}


resource "random_password" "mysql_root_password" {
  length           = 16
  special          = false
}

resource "random_password" "mysql_user_password" {
  length           = 16
  special          = false
}


resource "docker_image" "mysql" {
  name         = "mysql:8"
  keep_locally = false #
}

resource "docker_container" "mysql" {
  name  = "exemple_${random_password.mysql_user_password.result}"
  image = docker_image.mysql.image_id

  ports {
    internal = 3306
    external = 3306
    ip       = "127.0.0.1"
  }

  env = [
    "MYSQL_ROOT_PASSWORD=${random_password.mysql_root_password.result}",
    "MYSQL_DATABASE=wordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=${random_password.mysql_user_password.result}",
    "MYSQL_ROOT_HOST=%"
  ]

  restart = "unless-stopped"
}


output "container_name" {
  value = docker_container.mysql.name
  sensitive = true
}

output "mysql_root_password" {
  value     = random_password.mysql_root_password.result
  sensitive = true
}

output "mysql_user_password" {
  value     = random_password.mysql_user_password.result
  sensitive = true
}
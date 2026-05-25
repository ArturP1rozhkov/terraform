terraform {
  required_version = ">1.12.0"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "> 0.9"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "> 5.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "> 3.5"
    }
  }
}
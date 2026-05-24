variable "env_name" {
  type        = string
  description = "Environment name"
}

variable "network_name" {
  type        = string
  description = "VPC network name"
}

variable "zone" {
  type        = string
  description = "Availability zone for subnet"
}

variable "v4_cidr_blocks" {
  type        = list(string)
  description = "IPv4 CIDR blocks for subnet"
}
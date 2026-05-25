variable "env_name" {
  description = "Environment name"
  type        = string
}

variable "network_name" {
  description = "VPC network name"
  type        = string
  default     = null
}

variable "subnets" {
  description = "List of subnets to create"
  type = list(object({
    zone = string
    cidr = string
  }))
}
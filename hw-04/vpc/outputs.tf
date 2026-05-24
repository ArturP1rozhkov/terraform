output "network_id" {
  description = "VPC network ID"
  value       = yandex_vpc_network.this.id
}

output "subnet" {
  description = "Subnet object"
  value = {
    id             = yandex_vpc_subnet.this.id
    name           = yandex_vpc_subnet.this.name
    zone           = yandex_vpc_subnet.this.zone
    network_id     = yandex_vpc_subnet.this.network_id
    v4_cidr_blocks = yandex_vpc_subnet.this.v4_cidr_blocks
  }
}
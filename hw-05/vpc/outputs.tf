output "network_id" {
  description = "VPC network ID"
  value       = yandex_vpc_network.this.id
}

output "subnets" {
  description = "Map of created subnets"
  value       = yandex_vpc_subnet.this
}
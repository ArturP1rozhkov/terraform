resource "yandex_vpc_network" "this" {
  name = var.network_name != null ? var.network_name : var.env_name
}

resource "yandex_vpc_subnet" "this" {
  for_each = { for s in var.subnets : s.zone => s }

  name           = "${var.env_name}-${each.value.zone}"
  zone           = each.value.zone
  network_id     = yandex_vpc_network.this.id
  v4_cidr_blocks = [each.value.cidr]
}
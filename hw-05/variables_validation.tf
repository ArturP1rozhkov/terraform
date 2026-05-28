variable "ip_address" {
  type        = string
  description = "ip-адрес"
  default     = "192.168.0.1"

validation {
    condition     = can(cidrhost("${var.ip_address}/32", 0))
    error_message = "Переменная ip_address должна содержать корректный IP-адрес. Например: 192.168.0.1"
  }
}




  variable "ip_address_list" {
  type        = list(string)
  description = "список ip-адресов"
  default     = ["192.168.0.1", "1.1.1.1", "127.0.0.1"]

  validation {
    condition = alltrue([
      for ip in var.ip_address_list :
      can(cidrhost("${ip}/32", 0))
    ])
    error_message = "Все элементы списка ip_address_list должны быть корректными IP-адресами."
  }
}


variable "no_uppercase_string" {
  type        = string
  description = "любая строка"
  default     = "hello world"

  validation {
    condition     = var.no_uppercase_string == lower(var.no_uppercase_string)
    error_message = "Строка не должна содержать символы верхнего регистра."
  }
}


variable "in_the_end_there_can_be_only_one" {
  description = "Who is better Connor or Duncan?"
  type = object({
    Dunkan = optional(bool)
    Connor = optional(bool)
  })

  default = {
    Dunkan = true
    Connor = false
  }

  validation {
    error_message = "There can be only one MacLeod"
    condition = (
      var.in_the_end_there_can_be_only_one.Dunkan != var.in_the_end_there_can_be_only_one.Connor
    )
  }
}

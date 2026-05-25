output "vault_example" {
  value = nonsensitive(data.vault_generic_secret.vault_example.data)
}


output "vault_example_test_key" {
  value = nonsensitive(data.vault_generic_secret.vault_example.data["test"])
}
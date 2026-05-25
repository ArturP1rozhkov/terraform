provider "vault" {
  address         = "http://127.0.0.1:8200"
  skip_tls_verify = true
  token           = "education"
}

data "vault_generic_secret" "vault_example" {
  path = "secret/example"
}

resource "vault_generic_secret" "my_secret" {
  path      = "secret/my_tf_secret"
  data_json = jsonencode({
    username = "admin"
    password = "superpassword123"
  })
}
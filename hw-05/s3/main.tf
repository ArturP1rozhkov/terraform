module "s3" {
  source = "github.com/terraform-yc-modules/terraform-yc-s3?ref=e4017d77de83fe105604fa7b012bc809a77c2fa2"

  bucket_name   = "netology-course-bucket-kva" # уникальное имя по всему облаку
  force_destroy = false                        # флаг не удалять с объектами
  max_size      = 1073741824                   # размер 1 ГБ в байтах
}
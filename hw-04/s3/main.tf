module "s3" {
  source = "github.com/terraform-yc-modules/terraform-yc-s3"

  bucket_name   = "netology-course-bucket-kva" # уникальное имя по всему облаку
  force_destroy = false                        # флаг не удалять с объектами
  max_size      = 1073741824                   # размер 1 ГБ в байтах
}
locals {
  vm_web_name = "${var.env}-${var.vpc_name}-web"
  vm_db_name  = "${var.env}-${var.vpc_name}-db"
}
resource "random_password" "example" {
  count  = var.vm_count
  length = 16
  special = true
}
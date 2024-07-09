resource "azurerm_public_ip" "example" {
  count               = var.vm_count
  name                = "example-pip-${count.index}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Dynamic"
}
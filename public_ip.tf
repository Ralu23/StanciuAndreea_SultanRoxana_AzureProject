resource "azurerm_public_ip" "rg" {
  count               = var.vm_count
  name                = "acceptanceTestPublicIp1-${count.index}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
}
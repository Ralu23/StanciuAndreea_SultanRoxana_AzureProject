resource "azurerm_linux_virtual_machine" "example" {
  count               = var.vm_count
  name                = "example-vm-${count.index}"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = var.vm_size

  admin_username      = "adminuser"
  admin_password      = random_password.example[count.index].result

  network_interface_ids = [
    azurerm_network_interface.example[count.index].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = var.vm_image
    version   = "latest"
  }
}

# Output pentru adresa IP privată a VM-urilor
output "private_ip_addresses" {
  value = azurerm_network_interface.example[*].private_ip_address
}
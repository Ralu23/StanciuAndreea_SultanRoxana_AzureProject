resource "null_resource" "ping_test" {
  count = var.vm_count - 1

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = element(azurerm_network_interface.rg.*.private_ip_address, count.index)
      user        = "adminuser"
      private_key = file("~/.ssh/id_rsa")
      timeout     = "5m"
    }

    inline = [
      "ping -c 4 ${element(azurerm_network_interface.rg.*.private_ip_address, count.index + 1)}"
    ]
  }

  depends_on = [azurerm_linux_virtual_machine.rg]
}
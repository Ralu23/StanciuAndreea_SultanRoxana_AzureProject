resource "null_resource" "ping_test" {
  count = var.vm_count

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = azurerm_linux_virtual_machine.rg[count.index].private_ip_address
      user        = "adminuser"
      private_key = file("~/.ssh/id_rsa")
      timeout     = "5m"
    }

    inline = [
      "ping -c 4 ${azurerm_linux_virtual_machine.rg[count.index + 1].private_ip_address}"
    ]
  }

  depends_on = [azurerm_linux_virtual_machine.rg]
}
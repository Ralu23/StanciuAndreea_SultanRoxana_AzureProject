resource "null_resource" "ping_test" {
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = azurerm_network_interface.example[0].private_ip_address
      user        = "adminuser"
      password    = random_password.example[0].result
      # Pentru VM-uri în producție, ar trebui să folosiți autentificare prin chei SSH
    }

    inline = [
      "ping -c 4 ${azurerm_network_interface.example[1].private_ip_address}"
    ]
  }
}
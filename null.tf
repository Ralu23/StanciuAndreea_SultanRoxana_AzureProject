# resource "null_resource" "ping_test" {
#   provisioner "remote-exec" {
#     connection {
#       type        = "ssh"
#       host        = azurerm_network_interface.rg.private_ip_address
#       user        = "adminuser"
#       password    = random_password.password.result
#     }

#     inline = [
#       "ping -c 4 ${azurerm_network_interface.rg.private_ip_address}"
#     ]
#   }
# }
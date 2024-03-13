resource "azurerm_linux_virtual_machine" "aks" {
  name                = "aks"
  resource_group_name = azurerm_resource_group.showtech.name
  location            = azurerm_resource_group.showtech.location
  size                = "Standard_B2ats_v2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file(var.id_file)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  provisioner "file" {
    content     = "StrictHostKeyChecking no"
    destination = "/home/vsts/.ssh/config"
  }
}
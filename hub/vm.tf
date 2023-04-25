
resource "azurerm_network_interface" "jumpbox-nic" {
  name                = "${var.hub_prefix}-jumpbox-nic"
  location            = azurerm_resource_group.Hub-resource-group.location
  resource_group_name = azurerm_resource_group.Hub-resource-group.name

  ip_configuration {
    name                          = "jumpbox-config"
    subnet_id                     = data.azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "jumpbox" {
  name = "${var.hub_prefix}-jumpbox"
  location            = azurerm_resource_group.Hub-resource-group.location
  resource_group_name = azurerm_resource_group.Hub-resource-group.name
  size                = "Standard_B2s"
  admin_username      = "master"
  admin_password      = "password1234!"
  network_interface_ids = [
    azurerm_network_interface.jumpbox-nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-g2"
    version   = "latest"
  }
}
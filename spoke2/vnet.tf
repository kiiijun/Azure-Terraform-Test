resource "azurerm_virtual_network" "spoke_vnet" {
  name                = "${var.spoke_prefix}-vnet"
  location            = "${var.location}"
  resource_group_name = azurerm_resource_group.spoke-resource-group.name
  address_space       = ["10.2.0.0/16"]
}
resource "azurerm_network_security_group" "vm-nsg" {
  name                = "${var.hub_prefix}-vm-nsg"
  location            = "${var.location}"
  resource_group_name = azurerm_resource_group.Hub-resource-group.name
}
resource "azurerm_network_security_group" "endpoint-nsg" {
  name                = "${var.hub_prefix}-endpoint-nsg"
  location            = "${var.location}"
  resource_group_name = azurerm_resource_group.Hub-resource-group.name
}

resource "azurerm_virtual_network" "hub_vnet" {
  name                = "${var.hub_prefix}-vnet"
  location            = "${var.location}"
  resource_group_name = azurerm_resource_group.Hub-resource-group.name
  address_space       = ["10.0.0.0/16"]
  
  subnet {
    name           = "AzureFirewallSubnet"
    address_prefix = "10.0.254.0/26"
  }
  subnet {
    name           = "GatewaySubnet"
    address_prefix = "10.0.255.0/26"
  }

  subnet {
    name           = "vm-subnet"
    address_prefix = "10.0.0.0/24"
    security_group = azurerm_network_security_group.vm-nsg.id
  }

  subnet {
    name           = "endpoint-subnet"
    address_prefix = "10.0.253.0/27"
    security_group = azurerm_network_security_group.endpoint-nsg.id   
  }
}

data "azurerm_subnet" "azfw_subnet" {
  name = "AzureFirewallSubnet"
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
  resource_group_name = azurerm_resource_group.Hub-resource-group.name
}

data "azurerm_subnet" "vm_subnet" {
  name = "vm-subnet"
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
  resource_group_name = azurerm_resource_group.Hub-resource-group.name
}

data "azurerm_subnet" "gw_subnet" {
  name = "GatewaySubnet"
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
  resource_group_name = azurerm_resource_group.Hub-resource-group.name
}

data "azurerm_subnet" "endpoint_subnet" {
  name = "endpoint-subnet"
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
  resource_group_name = azurerm_resource_group.Hub-resource-group.name
}





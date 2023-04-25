resource "azurerm_public_ip" "fw_pip" {
  name                = "${var.hub_prefix}-fw-pip"
  location            = azurerm_resource_group.Hub-resource-group.location
  resource_group_name = azurerm_resource_group.Hub-resource-group.name
  allocation_method   = "Static"
  sku                 = "Standard"
  zones = [ ]
  
}
resource "azurerm_firewall_policy" "fw-pol" {
  name = "${var.hub_prefix}-fw-pol"
  resource_group_name = azurerm_resource_group.Hub-resource-group.name
  location = azurerm_resource_group.Hub-resource-group.location
}

resource "azurerm_firewall" "fw" {
  name                = "${var.hub_prefix}-fw"
  location            = azurerm_resource_group.Hub-resource-group.location
  resource_group_name = azurerm_resource_group.Hub-resource-group.name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"
  zones = [ ]
  firewall_policy_id = azurerm_firewall_policy.fw-pol.id

  ip_configuration {
    name                 = "ip_config"
    subnet_id            = data.azurerm_subnet.azfw_subnet.id
    public_ip_address_id = azurerm_public_ip.fw_pip.id
  }
}
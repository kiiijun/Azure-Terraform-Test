resource "azurerm_virtual_network_peering" "hub_to_spoke1" {
  name                      = "hub_to_spoke1"
  resource_group_name       = var.hub_rg_name
  virtual_network_name      = var.hub_vnet_name
  remote_virtual_network_id = var.spoke1_vnet_id
}
resource "azurerm_virtual_network_peering" "hub_to_spoke2" {
  name                      = "hub_to_spoke2"
  resource_group_name       = var.hub_rg_name
  virtual_network_name      = var.hub_vnet_name
  remote_virtual_network_id = var.spoke2_vnet_id
}

resource "azurerm_virtual_network_peering" "spoke1_to_hub" {
  name                      = "spoke1_to_hub"
  resource_group_name       = var.spoke1_rg_name
  virtual_network_name      = var.spoke1_vnet_name
  remote_virtual_network_id = var.hub_vnet_id
}
resource "azurerm_virtual_network_peering" "spoke2_to_hub" {
  name                      = "spoke2_to_hub"
  resource_group_name       = var.spoke2_rg_name
  virtual_network_name      = var.spoke2_vnet_name
  remote_virtual_network_id = var.hub_vnet_id
}
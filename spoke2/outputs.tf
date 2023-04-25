output "spoke2_rg_name" {
  value = azurerm_resource_group.spoke-resource-group.name
}
output "spoke2_vnet_name" {
  value = azurerm_virtual_network.spoke_vnet.name
}
output "spoke2_vnet_id" {
  value = azurerm_virtual_network.spoke_vnet.id
}
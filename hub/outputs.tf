output "hub_rg_name" {
  value = azurerm_resource_group.Hub-resource-group.name
}
output "hub_vnet_name" {
  value = azurerm_virtual_network.hub_vnet.name
}
output "hub_vnet_id" {
  value = azurerm_virtual_network.hub_vnet.id
}
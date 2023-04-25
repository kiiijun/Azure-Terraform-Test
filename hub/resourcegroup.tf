resource "azurerm_resource_group" "Hub-resource-group" {
  name     = "${var.hub_prefix}-rg"
  location = "${var.location}"
}

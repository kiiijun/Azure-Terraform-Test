resource "azurerm_resource_group" "spoke-resource-group" {
  name     = "${var.spoke_prefix}-rg"
  location = "${var.location}"
}

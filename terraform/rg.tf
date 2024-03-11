resource "azurerm_resource_group" "showtech" {
  location = module.global.location
  name     = "showtech"
}
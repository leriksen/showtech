resource "azurerm_resource_group" "spn" {
  location = module.global.location
  name     = "showtech"
}
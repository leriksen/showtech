resource "azurerm_virtual_network" "vnet" {
  address_space       = [
    "10.77.0.0/16"
  ]
  location            = azurerm_resource_group.showtech.location
  name                = "vnet"
  resource_group_name = azurerm_resource_group.showtech.name
}

resource "azurerm_subnet" "public" {
  address_prefixes     = [
    "10.77.10.0/24"
  ]
  name                 = "public"
  resource_group_name  = azurerm_resource_group.showtech.name
  virtual_network_name = azurerm_virtual_network.vnet.name
}

resource "azurerm_subnet" "private" {
  address_prefixes     = [
    "10.77.110.0/24"
  ]
  name                 = "private"
  resource_group_name  = azurerm_resource_group.showtech.name
  virtual_network_name = azurerm_virtual_network.vnet.name
}

resource "azurerm_public_ip" "ip" {
  allocation_method   = "Dynamic"
  location            = azurerm_resource_group.showtech.location
  name                = "public"
  resource_group_name = azurerm_resource_group.showtech.name
}

resource "azurerm_network_interface" "nic" {
  name                = "nic"
  location            = azurerm_resource_group.showtech.location
  resource_group_name = azurerm_resource_group.showtech.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.public.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.ip.id
  }
}


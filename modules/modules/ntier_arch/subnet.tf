resource "azurerm_subnet" "web" {
  name                 = "${var.first}-sub1"
  address_prefix       = "10.0.1.0/24"
  resource_group_name  = "${azurerm_resource_group.trail.name}"
  virtual_network_name = "${azurerm_virtual_network.trail.name}"
}

resource "azurerm_subnet" "business" {
  name                 = "${var.first}-sub2"
  address_prefix       = "10.0.2.0/24"
  resource_group_name  = "${azurerm_resource_group.trail.name}"
  virtual_network_name = "${azurerm_virtual_network.trail.name}"
}

resource "azurerm_subnet" "db" {
  name                 = "${var.first}-sub3"
  address_prefix       = "10.0.3.0/24"
  resource_group_name  = "${azurerm_resource_group.trail.name}"
  virtual_network_name = "${azurerm_virtual_network.trail.name}"
}

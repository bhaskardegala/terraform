resource "azurerm_network_interface" "web" {
  name                      = "${var.first}-ani"
  location                  = "${azurerm_resource_group.trail.location}"
  resource_group_name       = "${azurerm_resource_group.trail.name}"
  network_security_group_id = "${azurerm_network_security_group.web.id}"

  ip_configuration {
    subnet_id                     = "${azurerm_subnet.web.id}"
    name                          = "testingip"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.web.id}"
  }
}

resource "azurerm_network_interface" "backend" {
  name                      = "${var.first}-ani2"
  location                  = "${azurerm_resource_group.trail.location}"
  resource_group_name       = "${azurerm_resource_group.trail.name}"
  network_security_group_id = "${azurerm_network_security_group.backend.id}"

  ip_configuration {
    subnet_id                     = "${azurerm_subnet.backend.id}"
    name                          = "testingip2"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "db" {
  name                      = "${var.first}-ani3"
  location                  = "${azurerm_resource_group.trail.location}"
  resource_group_name       = "${azurerm_resource_group.trail.name}"
  network_security_group_id = "${azurerm_network_security_group.db.id}"

  ip_configuration {
    subnet_id                     = "${azurerm_subnet.db.id}"
    name                          = "testingip3"
    private_ip_address_allocation = "Dynamic"
  }
}

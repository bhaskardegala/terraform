resource "azurerm_network_security_group" "web" {
  name                = "${var.first}-nsg"
  location            = "${azurerm_resource_group.trail.location}"
  resource_group_name = "${azurerm_resource_group.trail.name}"
}

resource "azurerm_network_security_group" "backend" {
  name                = "${var.first}-nsg2"
  location            = "${azurerm_resource_group.trail.location}"
  resource_group_name = "${azurerm_resource_group.trail.name}"
}

resource "azurerm_network_security_group" "db" {
  name                = "${var.first}-nsg3"
  location            = "${azurerm_resource_group.trail.location}"
  resource_group_name = "${azurerm_resource_group.trail.name}"
}

resource "azurerm_network_security_rule" "web_out1" {
  name                        = "${var.first}-rule1"
  direction                   = "outbound"
  priority                    = "1000"
  protocol                    = "tcp"
  source_address_prefix       = "10.0.1.0/24"
  destination_address_prefix  = "10.0.2.0/24"
  access                      = "allow"
  source_port_range           = "*"
  destination_port_range      = "*"
  resource_group_name         = "${azurerm_resource_group.trail.name}"
  network_security_group_name = "${azurerm_network_security_group.web.name}"
}

resource "azurerm_network_security_rule" "web_out2" {
  name                        = "${var.first}-rule2"
  direction                   = "outbound"
  priority                    = "2000"
  protocol                    = "tcp"
  source_address_prefix       = "10.0.1.0/24"
  destination_address_prefix  = "*"
  access                      = "deny"
  source_port_range           = "*"
  destination_port_range      = "*"
  resource_group_name         = "${azurerm_resource_group.trail.name}"
  network_security_group_name = "${azurerm_network_security_group.web.name}"
}

resource "azurerm_network_security_rule" "web_in" {
  name                        = "${var.first}-rule3"
  direction                   = "inbound"
  priority                    = "1000"
  protocol                    = "tcp"
  source_address_prefix       = "*"
  destination_address_prefix  = "10.0.1.0/24"
  access                      = "allow"
  source_port_range           = "*"
  destination_port_range      = "*"
  resource_group_name         = "${azurerm_resource_group.trail.name}"
  network_security_group_name = "${azurerm_network_security_group.web.name}"
}

resource "azurerm_network_security_rule" "backend_out1" {
  name                        = "${var.first}-rule1"
  direction                   = "outbound"
  priority                    = "1000"
  protocol                    = "tcp"
  source_address_prefix       = "10.0.2.0/24"
  destination_address_prefix  = "10.0.3.0/24"
  access                      = "allow"
  source_port_range           = "*"
  destination_port_range      = "*"
  resource_group_name         = "${azurerm_resource_group.trail.name}"
  network_security_group_name = "${azurerm_network_security_group.backend.name}"
}

resource "azurerm_network_security_rule" "backend_out2" {
  name                        = "${var.first}-rule2"
  direction                   = "outbound"
  priority                    = "2000"
  protocol                    = "tcp"
  source_address_prefix       = "10.0.2.0/24"
  destination_address_prefix  = "*"
  access                      = "deny"
  source_port_range           = "*"
  destination_port_range      = "*"
  resource_group_name         = "${azurerm_resource_group.trail.name}"
  network_security_group_name = "${azurerm_network_security_group.backend.name}"
}

resource "azurerm_network_security_rule" "backend_in1" {
  name                        = "${var.first}-rule3"
  direction                   = "inbound"
  priority                    = "1000"
  protocol                    = "tcp"
  source_address_prefix       = "10.0.1.0/24"
  destination_address_prefix  = "10.0.2.0/24"
  access                      = "allow"
  source_port_range           = "*"
  destination_port_range      = "*"
  resource_group_name         = "${azurerm_resource_group.trail.name}"
  network_security_group_name = "${azurerm_network_security_group.backend.name}"
}

resource "azurerm_network_security_rule" "backend_in2" {
  name                        = "${var.first}-rule4"
  direction                   = "inbound"
  priority                    = "2000"
  protocol                    = "tcp"
  source_address_prefix       = "*"
  destination_address_prefix  = "10.0.2.0/24"
  access                      = "deny"
  source_port_range           = "*"
  destination_port_range      = "*"
  resource_group_name         = "${azurerm_resource_group.trail.name}"
  network_security_group_name = "${azurerm_network_security_group.backend.name}"
}

resource "azurerm_network_security_rule" "db_out1" {
  name                        = "${var.first}-rule1"
  direction                   = "outbound"
  priority                    = "1000"
  protocol                    = "tcp"
  source_address_prefix       = "10.0.3.0/24"
  destination_address_prefix  = "*"
  access                      = "deny"
  source_port_range           = "*"
  destination_port_range      = "*"
  resource_group_name         = "${azurerm_resource_group.trail.name}"
  network_security_group_name = "${azurerm_network_security_group.db.name}"
}

resource "azurerm_network_security_rule" "db_in1" {
  name                        = "${var.first}-rule2"
  direction                   = "inbound"
  priority                    = "1000"
  protocol                    = "tcp"
  source_address_prefix       = "10.0.2.0/24"
  destination_address_prefix  = "10.0.3.0/24"
  access                      = "allow"
  source_port_range           = "*"
  destination_port_range      = "*"
  resource_group_name         = "${azurerm_resource_group.trail.name}"
  network_security_group_name = "${azurerm_network_security_group.db.name}" 
}

resource "azurerm_network_security_rule" "db_in2" {
  name                        = "${var.first}-rule3"
  direction                   = "inbound"
  priority                    = "2000"
  protocol                    = "tcp"
  source_address_prefix       = "*"
  destination_address_prefix  = "10.0.3.0/24"
  access                      = "deny"
  source_port_range           = "*"
  destination_port_range      = "*"
  resource_group_name         = "${azurerm_resource_group.trail.name}"
  network_security_group_name = "${azurerm_network_security_group.db.name}"
}

resource "azurerm_virtual_machine" "web" {
  name                  = "${var.first}-vm"
  resource_group_name   = "${azurerm_resource_group.trail.name}"
  location              = "${azurerm_resource_group.trail.location}"
  vm_size               = "Standard_B1s"
  network_interface_ids = ["${azurerm_network_interface.web.id}"]

  storage_os_disk {
    name          = "vm-osdisk-1"
    caching       = "ReadWrite"
    create_option = "FromImage"
    vhd_uri       = "https://learningbhaskar123.blob.core.windows.net/vhds/web-osdisk.vhd"
    disk_size_gb  = "30"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  delete_os_disk_on_termination = true

  os_profile {
    computer_name  = "web"
    admin_username = "${var.username_web_vm}"
    admin_password = "${var.password_web_vm}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_virtual_machine" "business" {
  name                  = "${var.first}-vm2"
  resource_group_name   = "${azurerm_resource_group.trail.name}"
  location              = "${azurerm_resource_group.trail.location}"
  vm_size               = "Standard_B1s"
  network_interface_ids = ["${azurerm_network_interface.business.id}"]

  storage_os_disk {
    name          = "vm-osdisk-2"
    caching       = "ReadWrite"
    create_option = "FromImage"
    vhd_uri       = "https://learningbhaskar123.blob.core.windows.net/vhds/business-osdisk.vhd"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  delete_os_disk_on_termination = true

  os_profile {
    computer_name  = "business"
    admin_username = "${var.username_business_vm}"
    admin_password = "${var.password_business_vm}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_virtual_machine" "db" {
  name                  = "${var.first}-vm3"
  resource_group_name   = "${azurerm_resource_group.trail.name}"
  location              = "${azurerm_resource_group.trail.location}"
  vm_size               = "Standard_B1s"
  network_interface_ids = ["${azurerm_network_interface.db.id}"]

  storage_os_disk {
    name          = "vm-osdisk-3"
    caching       = "ReadWrite"
    create_option = "FromImage"
    vhd_uri       = "https://learningbhaskar123.blob.core.windows.net/vhds/db-osdisk.vhd"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  delete_os_disk_on_termination = true

  os_profile {
    computer_name  = "db"
    admin_username = "${var.username_db_vm}"
    admin_password = "${var.password_db_vm}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_virtual_machine" "web" {
  name                  = "${var.first}-vm"
  resource_group_name   = "${azurerm_resource_group.trail.name}"
  location              = "${azurerm_resource_group.trail.location}"
  vm_size               = "Standard_F8s"
  network_interface_ids = ["${azurerm_network_interface.web.id}"]

  storage_os_disk {
    name          = "vm-osdisk-1"
    caching       = "ReadWrite"
    create_option = "FromImage"
    vhd_uri       = "https://${azurerm_storage_account.trail.name}.blob.core.windows.net/vhds/web-osdisk.vhd"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
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

resource "azurerm_virtual_machine" "backend" {
  name                  = "${var.first}-vm2"
  resource_group_name   = "${azurerm_resource_group.trail.name}"
  location              = "${azurerm_resource_group.trail.location}"
  vm_size               = "Standard_E8s_v3"
  network_interface_ids = ["${azurerm_network_interface.backend.id}"]

  storage_os_disk {
    name          = "vm-osdisk-2"
    caching       = "ReadWrite"
    create_option = "FromImage"
    vhd_uri       = "https://${azurerm_storage_account.trail.name}.blob.core.windows.net/vhds/backend-osdisk.vhd"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  delete_os_disk_on_termination = true

  os_profile {
    computer_name  = "backend"
    admin_username = "${var.username_backend_vm}"
    admin_password = "${var.password_backend_vm}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_virtual_machine" "db" {
  name                  = "${var.first}-vm3"
  resource_group_name   = "${azurerm_resource_group.trail.name}"
  location              = "${azurerm_resource_group.trail.location}"
  vm_size               = "Standard_Lsv2"
  network_interface_ids = ["${azurerm_network_interface.db.id}"]

  storage_os_disk {
    name          = "vm-osdisk-3"
    caching       = "ReadWrite"
    create_option = "FromImage"
    vhd_uri       = "https://${azurerm_storage_account.trail.name}.blob.core.windows.net/vhds/db-osdisk.vhd"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
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

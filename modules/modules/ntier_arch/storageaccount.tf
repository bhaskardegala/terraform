resource "azurerm_storage_account" "trail" {
  account_tier             = "Standard"
  location                 = "${azurerm_resource_group.trail.location}"
  name                     = "${var.first}sa12345"
  resource_group_name      = "${azurerm_resource_group.trail.name}"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "trail" {
  name                  = "vhds"
  resource_group_name   = "${azurerm_resource_group.trail.name}"
  storage_account_name  = "${azurerm_storage_account.trail.name}"
  container_access_type = "blob"
}
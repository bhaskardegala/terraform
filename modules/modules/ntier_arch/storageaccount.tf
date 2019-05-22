resource "azurerm_storage_account" "trail" {
  account_tier             = "Standard"
  location                 = "${azurerm_resource_group.trail.location}"
  name                     = "learningbhaskar123"
  resource_group_name      = "${azurerm_resource_group.trail.name}"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "trail" {
  name                  = "vhds"
  resource_group_name   = "${azurerm_resource_group.trail.name}"
  storage_account_name  = "${azurerm_storage_account.trail.name}"
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "web" {
  name                   = "sample_web.vhd"
  resource_group_name    = "${azurerm_resource_group.trail.name}"
  storage_account_name   = "${azurerm_storage_account.trail.name}"
  storage_container_name = "${azurerm_storage_container.trail.name}"
  type                   = "page"
  size                   = 51200
}

resource "azurerm_storage_blob" "business" {
  name                   = "sample_business.vhd"
  resource_group_name    = "${azurerm_resource_group.trail.name}"
  storage_account_name   = "${azurerm_storage_account.trail.name}"
  storage_container_name = "${azurerm_storage_container.trail.name}"
  type                   = "page"
  size                   = 51200 
}

resource "azurerm_storage_blob" "db" {
  name                   = "sample_db.vhd"
  resource_group_name    = "${azurerm_resource_group.trail.name}"
  storage_account_name   = "${azurerm_storage_account.trail.name}"
  storage_container_name = "${azurerm_storage_container.trail.name}"
  type                   = "page"
  size                   = 51200
}

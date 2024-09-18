# Create Storage Account
resource "azurerm_storage_account" "storage_account" {
  resource_group_name      = var.resource_group_name
  location                 = var.location
  name                     = var.storage_account_name
  account_kind             = var.account_kind
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  tags                     = var.tags
}

# Create Storage Container
resource "azurerm_storage_container" "storage_container" {
  name                 = var.storage_container_name
  storage_account_name = azurerm_storage_account.storage_account.name
}
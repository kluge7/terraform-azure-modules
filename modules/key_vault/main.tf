# Fetch the Object ID of the service principal running Terraform
data "azurerm_client_config" "example" {}

# Create a Key Vault
resource "azurerm_key_vault" "key_vault" {
  name                = "${var.resource_group_name}-vault"
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = data.azurerm_client_config.example.tenant_id
  sku_name            = "standard"

  # Access policy for the service principal running Terraform
  access_policy {
    tenant_id = data.azurerm_client_config.example.tenant_id
    object_id = data.azurerm_client_config.example.object_id

    # Grant service principal secret permissions
    secret_permissions = ["Get", "Set", "List", "Delete", "Purge", "Recover"]
  }
}

# Store the Storage Account Access Key in the Key Vault
resource "azurerm_key_vault_secret" "storage_account_key" {
  name         = "storage-account-key"
  value        = var.storage_account_key
  key_vault_id = azurerm_key_vault.key_vault.id
}

# Store the VM username in the Key Vault
resource "azurerm_key_vault_secret" "vm_username" {
  name         = "vm-username"
  value        = var.vm_username
  key_vault_id = azurerm_key_vault.key_vault.id
}

# Store the VM password in the Key Vault
resource "azurerm_key_vault_secret" "vm_password" {
  name         = "vm-password"
  value        = var.vm_password
  key_vault_id = azurerm_key_vault.key_vault.id
}
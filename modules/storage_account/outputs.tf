output "primary_access_key" {
  value = azurerm_storage_account.storage_account.primary_access_key
}

output "primary_blob_endpoint" {
  description = "Primary blob endpoint"
  value       = azurerm_storage_account.storage_account.primary_blob_endpoint
}

output "connection_string" {
  description = "Storage account connection string"
  value       = azurerm_storage_account.storage_account.primary_connection_string
}
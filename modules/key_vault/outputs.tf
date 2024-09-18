output "key_vault_id" {
  value = azurerm_key_vault.key_vault.id
}

output "storage_account_key_secret_id" {
  value = azurerm_key_vault_secret.storage_account_key.id
}

output "vm_username_secret_id" {
  value = azurerm_key_vault_secret.vm_username.id
}

output "vm_password_secret_id" {
  value = azurerm_key_vault_secret.vm_password.id
}

output "vm_username" {
  value = var.vm_username
}
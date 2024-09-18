# Network Module Outputs
output "subnet_id" {
  description = "The ID of the Subnet"
  value       = module.network.subnet_id
}

# Storage Account Module Outputs
output "storage_account_connection_string" {
  description = "The connection string for the storage account"
  value       = module.storage_account.connection_string
  sensitive   = true
}

# Key Vault Module Outputs
output "key_vault_id" {
  description = "The ID of the Key Vault"
  value       = module.key_vault.key_vault_id
}

# Virtual Machine Module Outputs
output "vm_public_ip" {
  value = module.virtual_machine.public_ip
  description = "The public IP address of the Virtual Machine"
}

output "vm_username" {
    value = module.key_vault.vm_username
    description = "The username for the Virtual Machine"
}


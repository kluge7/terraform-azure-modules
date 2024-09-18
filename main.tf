terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

# Generate a random string for suffix
resource "random_string" "suffix" {
  length  = 5
  upper   = false
  special = false
}

# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Call the Storage Account Module
module "storage_account" {
  source                   = "./modules/storage_account"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  storage_account_name     = "${var.storage_account_name}${random_string.suffix.result}"
  account_kind             = var.account_kind
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  storage_container_name   = var.storage_container_name
  tags                     = var.tags
}

# Call the Key Vault Module
module "key_vault" {
  source              = "./modules/key_vault"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  # Pass the Storage Account Access Key to Key Vault
  storage_account_key = module.storage_account.primary_access_key

  # VM credentials
  vm_username = var.vm_username
  vm_password = var.vm_password

  depends_on = [
    azurerm_resource_group.rg
  ]
}

# Call the Network Module
module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vnet_name           = var.vnet_name
  subnet_name         = var.subnet_name
  nsg_name            = var.nsg_name
  tags                = var.tags
}

# Call the Virtual Machine Module
module "virtual_machine" {
  source              = "./modules/virtual_machine"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vm_name             = var.vm_name
  vm_size             = var.vm_size

  # Pass Key Vault ID for secret retrieval (VM username and password)
  key_vault_id = module.key_vault.key_vault_id

  # Pass network dependencies from the Network Module
  subnet_id = module.network.subnet_id
  nsg_id    = module.network.nsg_id

  tags = var.tags

  depends_on = [
    module.key_vault
  ]
}
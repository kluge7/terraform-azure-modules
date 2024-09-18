variable "resource_group_name" {
  type        = string
  description = "The name of the resource group where Key Vault will be created."
}

variable "location" {
  type        = string
  description = "The Azure region where the Key Vault will be created."
}

variable "storage_account_key" {
  type        = string
  description = "The primary access key for the Storage Account."
}

variable "vm_username" {
  type        = string
  description = "The username for the Virtual Machine."
}

variable "vm_password" {
  type        = string
  description = "The password for the Virtual Machine."
}
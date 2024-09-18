# General Variables
variable "subscription_id" {
  type        = string
  description = "The Azure subscription ID."
}

variable "resource_group_name" {
  description = "The name of the resource group where the resources will be created."
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resources."
  type        = map(string)
  default     = {}
}

# Storage Account Module
variable "account_kind" {
  description = "Defines the kind of storage account."
  type        = string
}

variable "account_tier" {
  description = "The tier of the storage account (Standard or Premium)."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "The replication type of the storage account (LRS, GRS, RAGRS, ZRS)."
  type        = string
  default     = "LRS"
}

variable "storage_account_name" {
  description = "The name of the storage account. Must be globally unique."
  type        = string
}

variable "storage_container_name" {
  description = "The name of the storage container."
  type        = string
}

# Network Module
variable "vnet_name" {
  description = "The name of the Virtual Network (VNET)"
  type        = string
}

variable "subnet_name" {
  description = "The name of the Subnet"
  type        = string
}

variable "nsg_name" {
  description = "The name of the Network Security Group (NSG)"
  type        = string
}

# Virtual Machine Module
variable "vm_username" {
  type        = string
  description = "The username for the Virtual Machine."
}

variable "vm_password" {
  type        = string
  description = "The password for the Virtual Machine."
}

variable "vm_name" {
  type        = string
  description = "The name of the Virtual Machine."
}

variable "vm_size" {
  type        = string
  description = "The size of the Virtual Machine."
}

variable "resource_group_name" {
  description = "The name of the resource group where the storage account will be created."
  type        = string
}

variable "location" {
  description = "The Azure region where the storage account will be created."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account. Must be globally unique."
  type        = string
}

variable "account_kind" {
  description = "Defines the kind of storage account."
  type        = string
  default     = "StorageV2"
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

variable "storage_container_name" {
  description = "The name of the storage container."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resources."
  type        = map(string)
  default     = {}
}

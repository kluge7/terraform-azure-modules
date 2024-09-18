variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location where the resources will be created"
  type        = string
}

variable "vm_name" {
  description = "The name of the Virtual Machine"
  type        = string
}

variable "vm_size" {
  description = "The size of the VM (e.g., Standard_B1s, Standard_D2s_v3)"
  type        = string
  default     = "Standard_B1s"
}

variable "subnet_id" {
  description = "The ID of the subnet where the VM will be created"
  type        = string
}

variable "nsg_id" {
  description = "The ID of the Network Security Group (NSG) to associate with the VM"
  type        = string
}

variable "key_vault_id" {
  description = "The ID of the Key Vault where the VM credentials are stored"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default     = {}
}
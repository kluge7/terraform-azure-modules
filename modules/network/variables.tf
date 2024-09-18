variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location where the resources will be created"
  type        = string
}

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

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default     = {}
}

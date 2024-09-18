output "public_ip" {
  description = "The public IP address of the Virtual Machine"
  value       = azurerm_public_ip.public_ip.ip_address
}

output "vm_id" {
  description = "The ID of the Virtual Machine"
  value       = azurerm_linux_virtual_machine.vm.id
}

output "nic_id" {
  description = "The ID of the Network Interface"
  value       = azurerm_network_interface.nic.id
}

# Create a Public IP address for the VM
resource "azurerm_public_ip" "public_ip" {
  name                = "pip-${var.vm_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"

  tags = var.tags
}

# Create a Network Interface (NIC) for the VM
resource "azurerm_network_interface" "nic" {
  name                = "nic-${var.vm_name}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"

    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}

# Retrieve the VM username from Key Vault
data "azurerm_key_vault_secret" "vm_username" {
  key_vault_id = var.key_vault_id
  name         = "vm-username"
}

# Retrieve the VM password from Key Vault
data "azurerm_key_vault_secret" "vm_password" {
  key_vault_id = var.key_vault_id
  name         = "vm-password"
}

# Create a Linux Virtual Machine (VM)
resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size

  # Use the secrets retrieved from Key Vault for authentication
  admin_username = data.azurerm_key_vault_secret.vm_username.value
  admin_password = data.azurerm_key_vault_secret.vm_password.value

  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # Use an Ubuntu image from Canonical for the VM
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  tags = var.tags
}

# Associate the NSG with the Network Interface (NIC)
resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = var.nsg_id
}

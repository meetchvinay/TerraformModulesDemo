resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = "${var.name_prefix}-vm-nic-${count.index + 1}" #amexgold-dev-vm-nic-1
  location            = var.location
  resource_group_name = var.resource_group
  tags                = var.tags

  ip_configuration {
    name                          = "${var.name_prefix}-vm-ipconfig-${count.index + 1}" #amexgold-dev-vm-ipconfig-1
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }  
}

resource "azurerm_linux_virtual_machine" "vm" {
  count               = var.vm_count
  name                = "${var.name_prefix}-vm-${count.index + 1}" #amexgold-dev-vm-1
  resource_group_name = var.resource_group
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id,
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
      publisher = "Canonical"
      offer     = "Ubuntu-24_04-lts"
      sku       = "server"
      version   = "latest"
  }
  tags = var.tags  
}
output "virtual_machine_names" {
  value = azurerm_linux_virtual_machine.vm[*].name
}

output "network_interface_ids" {
  value = azurerm_network_interface.nic[*].id
}

output "private_ip_addresses" {
  value = azurerm_network_interface.nic[*].private_ip_address
}
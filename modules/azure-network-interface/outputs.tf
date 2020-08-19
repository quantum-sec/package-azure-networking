output "id" {
  description = "The ID of the network interface."
  value       = azurerm_network_interface.interface.id
}

output "name" {
  description = "The name of the interface."
  value       = azurerm_network_interface.name
}

output "mac_address" {
  description = "The Media Access Control (MAC) Address of the Network Interface."
  value       = azurerm_network_interface.mac_address
}

output "virtual_machine_id" {
  description = "The ID of the Virtual Machine which this Network Interface is connected"
  value       = azurerm_network_interface.virtual_machine_id
}

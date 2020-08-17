output "id" {
  description = "The ID of the subnet."
  value       = azurerm_network_interface.interface.id
}

output "name" {
  description = "The name of the interface."
  value       = azurerm_network_interface.name
}

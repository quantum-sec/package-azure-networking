output "id" {
  description = "The ID of the virtual network."
  value       = azurerm_virtual_network.network.id
}

output "name" {
  description = "The name of the virtual network."
  value       = azurerm_virtual_network.network.name
}

output "address_space" {
  description = "The IP address space of the virtual network."
  value       = azurerm_virtual_network.network.address_space
}

output "guid" {
  description = "The GUID of the virtual network."
  value       = azurerm_virtual_network.network.guid
}

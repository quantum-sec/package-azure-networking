output "id" {
  description = "The ID of the subnet NSG association."
  value       = azurerm_subnet_network_security_group_association.association.id
}

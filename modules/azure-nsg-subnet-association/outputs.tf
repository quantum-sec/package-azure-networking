output "id" {
  description = "The ID of the Subnet."
  value       = azurerm_subnet_network_security_group_association.subnet_nsg.id
}

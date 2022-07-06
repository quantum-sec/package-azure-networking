output "id" {
  description = "The ID of the network security rule."
  value       = azurerm_network_security_rule.rule.id
}

output "name" {
  description = "The name of network security rule."
  value       = azurerm_network_security_rule.rule.name
}

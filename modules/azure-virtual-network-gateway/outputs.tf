output "gateway_id" {
  description = "The ID of the virtual network gateway."
  value       = azurerm_virtual_network_gateway.gateway.id
}

output "bgp_settings" {
  description = "The BGP setting of the virtual network gateway."
  value       = azurerm_virtual_network_gateway.gateway.bgp_settings
}

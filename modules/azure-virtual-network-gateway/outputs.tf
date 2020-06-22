output "gateway_id" {
  description = "The ID of the virtual network gateway."
  value       = azurerm_virtual_network_gateway.gateway.id
}

output "public_ip" {
  description = "The public IP address of the virtual network gateway."
  value       = azurerm_public_ip.public_ip
}

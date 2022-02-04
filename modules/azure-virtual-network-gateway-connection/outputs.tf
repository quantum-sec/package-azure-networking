output "local_network_gateway_id" {
  description = "The ID of the local network gateway."
  value       = azurerm_local_network_gateway.remote.id
}

output "ipsec_pre_shared_key" {
  description = "The pre-shared key used to establish the IPSec connection."
  sensitive   = true
  value       = random_password.psk.result
}

output "connection_id" {
  description = "The ID of the virtual network gateway connection."
  value       = azurerm_virtual_network_gateway_connection.connection.id
}

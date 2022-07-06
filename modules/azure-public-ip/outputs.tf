output "id" {
  description = "The ID of the public IP address."
  value       = azurerm_public_ip.public.id
}

output "ip_address" {
  description = "The IP address value allocated."
  value       = azurerm_public_ip.public.ip_address
}

output "fqdn" {
  description = "Fully qualified domain name of the A DNS record associated with the public IP."
  value       = azurerm_public_ip.public.fqdn
}

output "id" {
  description = "The public ID of the IP."
  value       = azurerm_public_ip.public.id
}

output "ip_address" {
  description = "The IP address value allocated."
  value       = azurerm_public_ip.public.ip_address
}

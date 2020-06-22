output "id" {
  value = azurerm_virtual_network.network.id
}

output "name" {
  value = azurerm_virtual_network.network.name
}

output "address_space" {
  value = azurerm_virtual_network.network.address_space
}

output "guid" {
  value = azurerm_virtual_network.network.guid
}

output "subnets" {
  value = azurerm_virtual_network.network.subnet
}

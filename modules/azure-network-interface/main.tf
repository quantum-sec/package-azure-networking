# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY AN AZURE NETWORK INTERFACE
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
terraform {
  required_version = ">= 0.12"
}

resource "azurerm_network_interface" "interface" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags


  ip_configuration = {
    ip_name                       = var.ip_name
    subnet_id                     = var.subnet.id
    private_ip_address_allocation = var.private_ip_address_allocation
    private_ip_address_version    = var.private_ip_address_version
    private_ip_address            = var.private_ip_address
    primary                       = var.primary
  }
}

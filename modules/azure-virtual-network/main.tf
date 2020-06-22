# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY AN AZURE VIRTUAL NETWORK
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

terraform {
  required_version = ">= 0.12"
}

resource "azurerm_virtual_network" "network" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  tags                = var.tags

  dynamic "ddos_protection_plan" {
    for_each = var.ddos_protection_plan_id == null ? [] : [1]

    content {
      id     = var.ddos_protection_plan_id
      enable = true
    }
  }

  dynamic "subnet" {
    for_each = var.subnets

    content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
      security_group = subnet.value.security_group_id
    }
  }
}

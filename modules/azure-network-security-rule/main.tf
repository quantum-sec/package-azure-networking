# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY AN AZURE NETWORK SECURITY RULE
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

terraform {
  required_version = ">= 1.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "azurerm_network_security_rule" "rule" {
  name                        = var.name
  resource_group_name         = var.resource_group_name
  network_security_group_name = var.network_security_group_name
  description                 = var.description
  protocol                    = var.protocol
  access                      = var.access
  priority                    = var.priority
  direction                   = var.direction

  source_port_range                     = var.source_port.range
  source_port_ranges                    = var.source_port.ranges
  source_address_prefix                 = var.source_address.prefix
  source_address_prefixes               = var.source_address.prefixes
  source_application_security_group_ids = var.source_application_security_group_ids

  destination_port_range                     = var.destination_port.range
  destination_port_ranges                    = var.destination_port.ranges
  destination_address_prefix                 = var.destination_address.prefix
  destination_address_prefixes               = var.destination_address.prefixes
  destination_application_security_group_ids = var.destination_application_security_group_ids
}

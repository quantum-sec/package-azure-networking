# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY A LOCAL NETWORK GATEWAY
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

resource "azurerm_local_network_gateway" "remote" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space

  dynamic "bgp_settings" {
    for_each = var.bgp_settings
    content {
      asn                 = bgp_settings.value["asn"]
      bgp_peering_address = bgp_settings.value["bgp_peering_address"]
      peer_weight         = bgp_settings.value["peer_weight"]
    }
  }
  gateway_address = var.gateway.address
  gateway_fqdn    = var.gateway.fqdn
  tags            = var.tags
}

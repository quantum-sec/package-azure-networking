# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY AN AZURE VIRTUAL NETWORK GATEWAY
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

terraform {
  required_version = ">= 1.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
  experiments      = [module_variable_optional_attrs]
}

resource "azurerm_virtual_network_gateway" "gateway" {

  dynamic "ip_configuration" {
    for_each = var.ip_configuration
    content {
      name                          = ip_configuration.value["name"]
      private_ip_address_allocation = ip_configuration.value["private_ip_address_allocation"]
      subnet_id                     = ip_configuration.value["subnet_id"]
      public_ip_address_id          = ip_configuration.value["public_ip_address_id"]
    }
  }
  location                         = var.location
  name                             = var.name
  resource_group_name              = var.resource_group_name
  sku                              = var.vpn_type == "PolicyBased" ? "Basic" : var.sku
  type                             = var.sku == "UltraPerformance" ? "ExpressRoute" : var.type
  active_active                    = var.active_active
  default_local_network_gateway_id = var.default_local_network_gateway_id
  edge_zone                        = var.edge_zone
  enable_bgp                       = var.enable_bgp

  dynamic "bgp_settings" {
    for_each = var.bgp_settings
    content {
      asn = bgp_settings.value["asn"]

      dynamic "peering_addresses" {
        for_each = lookup(bgp_settings.value, "peering_addresses", null) != null ? bgp_settings.value["peering_addresses"] : []
        content {
          ip_configuration_name = peering_addresses.value["ip_configuration_name"]
          apipa_addresses       = peering_addresses.value["apipa_addresses"]
        }
      }
      peer_weight = bgp_settings.value["peer_weight"]
    }
  }
  generation                 = var.generation
  private_ip_address_enabled = var.private_ip_address_enabled
  tags                       = var.tags

  dynamic "vpn_client_configuration" {
    for_each = var.vpn_client_configuration
    content {
      address_space = vpn_client_configuration.value["address_space"]
      aad_tenant    = vpn_client_configuration.value["aad_tenant"]
      aad_audience  = vpn_client_configuration.value["aad_audience"]
      aad_issuer    = vpn_client_configuration.value["aad_issuer"]

      dynamic "root_certificate" {
        for_each = lookup(vpn_client_configuration.value, "root_certificate", null) != null ? vpn_client_configuration.value["root_certificate"] : []
        content {
          name             = root_certificate.value["name"]
          public_cert_data = try(base64encode(trimspace(replace(root_certificate.value["public_cert_data"], "/[-]+(BEGIN|END) CERTIFICATE[-]+/", ""))), null)
        }
      }

      dynamic "revoked_certificate" {
        for_each = lookup(vpn_client_configuration.value, "revoked_certificate", null) != null ? vpn_client_configuration.value["revoked_certificate"] : []
        content {
          name       = vpn_client_configuration.value["name"]
          thumbprint = vpn_client_configuration.value["thumbprint"]
        }
      }
      radius_server_address = vpn_client_configuration.value["radius_server_address"]
      radius_server_secret  = vpn_client_configuration.value["radius_server_secret"]
      vpn_client_protocols  = vpn_client_configuration.value["vpn_client_protocols"]
      vpn_auth_types        = vpn_client_configuration.value["vpn_auth_types"]
    }
  }
  vpn_type = var.vpn_type
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY AN AZURE VIRTUAL NETWORK GATEWAY
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

terraform {
  required_version = ">= 0.12"
}

resource "azurerm_public_ip" "public_ip" {
  allocation_method   = var.public_ip_address_allocation
  location            = var.location
  name                = "${var.name}-public-ip"
  resource_group_name = var.resource_group_name
}

resource "azurerm_virtual_network_gateway" "gateway" {
  lifecycle {
    ignore_changes = [
      # Azure populates this with defaults when `enable_bgp` is `false`.
      # Since we don't know the private address at deploy time, we can't set the default deterministically.
      # We'll instead ignore these defaults as we don't currently use Express Route or BGP advertisements.
      bgp_settings,
    ]
  }

  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku      = var.sku
  type     = var.type
  vpn_type = var.vpn_type

  enable_bgp = var.enable_bgp

  ip_configuration {
    name                          = "${var.name}-ip-config"
    private_ip_address_allocation = var.private_ip_address_allocation
    subnet_id                     = var.gateway_subnet_id
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }

  dynamic "bgp_settings" {
    for_each = var.enable_bgp == true ? [1] : []

    content {
      asn             = var.bgp_asn
      peering_address = var.bgp_peering_address
      peer_weight     = var.bgp_peer_weight
    }
  }

  dynamic "vpn_client_configuration" {
    for_each = var.type == "Vpn" ? [1] : []

    content {
      address_space        = var.vpn_address_space
      vpn_client_protocols = var.vpn_client_protocols

      dynamic "root_certificate" {
        for_each = var.vpn_root_certificate_name != null ? [1] : [0]

        content {
          name             = var.vpn_root_certificate_name
          public_cert_data = var.vpn_root_certificate_data
        }
      }
    }
  }
}

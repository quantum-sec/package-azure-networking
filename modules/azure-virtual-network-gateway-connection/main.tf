# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY A SITE-TO-SITE VPN CONNECTION
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

terraform {
  required_version = ">= 0.12"
}

locals {
  remote_gateway_address = var.remote_gateway_address != null ? var.remote_gateway_address : ""
  remote_gateway_fqdn    = var.remote_gateway_fqdn != null ? var.remote_gateway_fqdn : ""
}

# This resource is a workaround for the lack of multi-value support in `validation` blocks and the lack of custom error support.
# The latter is being discussed here: https://github.com/hashicorp/terraform/issues/15469
# And a (pretty stale) PR is open: https://github.com/hashicorp/terraform/pull/25088
resource "null_resource" "remote_gateway_validation" {
  provisioner "local-exec" {
    command     = "if [[ -z '${local.remote_gateway_address}' ]] && [[ -z '${local.remote_gateway_fqdn}' ]]; then echo 'Either remote_gateway_address or remote_gateway_fqdn must be set.'; exit 1; fi"
    interpreter = ["bash", "-c"]
  }
}

resource "azurerm_local_network_gateway" "remote" {
  depends_on = [null_resource.remote_gateway_validation]

  name                = "${var.name}-gateway"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags

  gateway_address = var.remote_gateway_address
  gateway_fqdn    = var.remote_gateway_fqdn != null && var.remote_gateway_address == null ? var.remote_gateway_fqdn : null

  address_space = var.remote_address_space
}

resource "random_password" "psk" {
  length  = 32
  special = true
  upper   = true
  lower   = true
  number  = true
}

resource "azurerm_virtual_network_gateway_connection" "connection" {
  name                = "${var.name}-connection"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  type                       = "IPSec"
  virtual_network_gateway_id = var.virtual_network_gateway_id
  local_network_gateway_id   = azurerm_local_network_gateway.remote.id
  connection_protocol        = var.connection_protocol
  shared_key                 = random_password.psk.result
}

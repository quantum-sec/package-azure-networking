# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY AN AZURE NETWORK SUBNET
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

resource "azurerm_subnet" "subnet" {
  name                 = var.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes

  dynamic "delegation" {
    for_each = var.delegation
    content {
      name = delegation.value["name"]
      dynamic "service_delegation" {
        for_each = delegation.value["service_delegation"]
        content {
          name    = service_delegation.value["name"]
          actions = service_delegation.value["actions"]
        }
      }
    }
  }
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies
  enforce_private_link_service_network_policies  = var.enforce_private_link_service_network_policies
  service_endpoints                              = var.service_endpoints
  service_endpoint_policy_ids                    = var.service_endpoint_policy_ids
}

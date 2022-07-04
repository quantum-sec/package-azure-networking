<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.12.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network_gateway.gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_active_active"></a> [active\_active](#input\_active\_active) | If `true`, an active-active Virtual Network Gateway will be created. If `false`, an active-standby gateway will be created. | `bool` | `null` | no |
| <a name="input_bgp_settings"></a> [bgp\_settings](#input\_bgp\_settings) | BGP settings for this virtual network gateway. | <pre>list(object({<br>    asn = optional(number)<br>    peering_addresses = optional(list(object({<br>      ip_configuration_name = optional(string)<br>      apipa_addresses       = optional(list(string))<br>    })))<br>    peer_weight = optional(number)<br>  }))</pre> | `[]` | no |
| <a name="input_default_local_network_gateway_id"></a> [default\_local\_network\_gateway\_id](#input\_default\_local\_network\_gateway\_id) | The ID of the local network gateway through which outbound Internet traffic from the virtual network in which the gateway is created will be routed (forced tunneling). | `string` | `null` | no |
| <a name="input_edge_zone"></a> [edge\_zone](#input\_edge\_zone) | Specifies the Edge Zone within the Azure Region where this Virtual Network Gateway should exist. | `string` | `null` | no |
| <a name="input_enable_bgp"></a> [enable\_bgp](#input\_enable\_bgp) | Enable BGP for this virtual network gateway. | `bool` | `null` | no |
| <a name="input_generation"></a> [generation](#input\_generation) | The Generation of the Virtual Network gateway. | `string` | `null` | no |
| <a name="input_ip_configuration"></a> [ip\_configuration](#input\_ip\_configuration) | IP configuration for the virtual network gateway. | <pre>list(object({<br>    name                          = optional(string)<br>    private_ip_address_allocation = optional(string)<br>    subnet_id                     = string<br>    public_ip_address_id          = string<br>  }))</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location in which this virtual network gateway will be provisioned. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the virtual network gateway. | `string` | n/a | yes |
| <a name="input_private_ip_address_enabled"></a> [private\_ip\_address\_enabled](#input\_private\_ip\_address\_enabled) | Should private IP be enabled on this gateway for connections. | `bool` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which this resource will be provisioned. | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | Configuration of the size and capacity of the virtual network gateway. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_type"></a> [type](#input\_type) | The type of virtual network gateway. | `string` | n/a | yes |
| <a name="input_vpn_client_configuration"></a> [vpn\_client\_configuration](#input\_vpn\_client\_configuration) | The VPN client configuration of the virtual network gateway | <pre>list(object({<br>    address_space = list(string)<br>    aad_tenant    = optional(string)<br>    aad_audience  = optional(string)<br>    aad_issuer    = optional(string)<br>    root_certificate = optional(list(object({<br>      name             = string<br>      public_cert_data = string<br>    })))<br>    revoked_certificate = optional(list(object({<br>      name       = string<br>      thumbprint = string<br>    })))<br>    radius_server_address = optional(string)<br>    radius_server_secret  = optional(string)<br>    vpn_client_protocols  = optional(set(string))<br>    vpn_auth_types        = optional(set(string))<br>  }))</pre> | `[]` | no |
| <a name="input_vpn_type"></a> [vpn\_type](#input\_vpn\_type) | The routing type of the virtual network gateway. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bgp_settings"></a> [bgp\_settings](#output\_bgp\_settings) | The BGP setting of the virtual network gateway. |
| <a name="output_gateway_id"></a> [gateway\_id](#output\_gateway\_id) | The ID of the virtual network gateway. |
<!-- END_TF_DOCS -->

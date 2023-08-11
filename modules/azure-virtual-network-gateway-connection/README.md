<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network_gateway_connection.connection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_authorization_key"></a> [authorization\_key](#input\_authorization\_key) | The authorization key associated with the Express Route Circuit. | `string` | `null` | no |
| <a name="input_connection_mode"></a> [connection\_mode](#input\_connection\_mode) | Connection mode to use. | `string` | `null` | no |
| <a name="input_connection_protocol"></a> [connection\_protocol](#input\_connection\_protocol) | The IKE protocol version to use. | `string` | `null` | no |
| <a name="input_custom_bgp_addresses"></a> [custom\_bgp\_addresses](#input\_custom\_bgp\_addresses) | Custom BGP Addresses. | <pre>list(object({<br>    primary   = string<br>    secondary = string<br>  }))</pre> | `[]` | no |
| <a name="input_dpd_timeout_seconds"></a> [dpd\_timeout\_seconds](#input\_dpd\_timeout\_seconds) | The dead peer detection timeout of this connection in seconds. | `number` | `null` | no |
| <a name="input_egress_nat_rule_ids"></a> [egress\_nat\_rule\_ids](#input\_egress\_nat\_rule\_ids) | A list of the egress NAT Rule Ids. | `list(string)` | `null` | no |
| <a name="input_enable_bgp"></a> [enable\_bgp](#input\_enable\_bgp) | BGP (Border Gateway Protocol) is enabled for this connection. | `bool` | `null` | no |
| <a name="input_express_route_circuit_id"></a> [express\_route\_circuit\_id](#input\_express\_route\_circuit\_id) | The ID of the Express Route Circuit when creating an ExpressRoute connection. | `string` | `null` | no |
| <a name="input_express_route_gateway_bypass"></a> [express\_route\_gateway\_bypass](#input\_express\_route\_gateway\_bypass) | If enabled data packets will bypass ExpressRoute Gateway for data forwarding. | `bool` | `null` | no |
| <a name="input_ingress_nat_rule_ids"></a> [ingress\_nat\_rule\_ids](#input\_ingress\_nat\_rule\_ids) | A list of the ingress NAT Rule Ids. | `list(string)` | `null` | no |
| <a name="input_ipsec_policy"></a> [ipsec\_policy](#input\_ipsec\_policy) | IPSec policy for Gateway connection. | <pre>list(object({<br>    dh_group         = string<br>    ike_encryption   = string<br>    ike_integrity    = string<br>    ipsec_encryption = string<br>    ipsec_integrity  = string<br>    pfs_group        = string<br>    sa_datasize      = optional(number)<br>    sa_lifetime      = optional(number)<br>  }))</pre> | `[]` | no |
| <a name="input_local_azure_ip_address_enabled"></a> [local\_azure\_ip\_address\_enabled](#input\_local\_azure\_ip\_address\_enabled) | Use private local Azure IP for the connection. | `bool` | `null` | no |
| <a name="input_local_network_gateway_id"></a> [local\_network\_gateway\_id](#input\_local\_network\_gateway\_id) | The ID of the local network gateway when creating Site-to-Site connection. | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | The location in which this network security group will be provisioned. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the connection. | `string` | n/a | yes |
| <a name="input_peer_virtual_network_gateway_id"></a> [peer\_virtual\_network\_gateway\_id](#input\_peer\_virtual\_network\_gateway\_id) | The ID of the peer virtual network gateway when creating a VNet-to-VNet connection. | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which this resource will be provisioned. | `string` | n/a | yes |
| <a name="input_routing_weight"></a> [routing\_weight](#input\_routing\_weight) | The routing weight. | `number` | `null` | no |
| <a name="input_shared_key"></a> [shared\_key](#input\_shared\_key) | The shared IPSec key. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A set of tags applied to this resource. | `map(string)` | `{}` | no |
| <a name="input_traffic_selector_policy"></a> [traffic\_selector\_policy](#input\_traffic\_selector\_policy) | Allows to specify a traffic selector policy proposal to be used in a virtual network gateway connection. | <pre>list(object({<br>    local_address_cidrs  = list(string)<br>    remote_address_cidrs = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_type"></a> [type](#input\_type) | The type of connection. | `string` | n/a | yes |
| <a name="input_use_policy_based_traffic_selectors"></a> [use\_policy\_based\_traffic\_selectors](#input\_use\_policy\_based\_traffic\_selectors) | Policy-based traffic selectors are enabled for this connection. | `bool` | `null` | no |
| <a name="input_virtual_network_gateway_id"></a> [virtual\_network\_gateway\_id](#input\_virtual\_network\_gateway\_id) | The ID of the virtual network gateway to which this connection is being made. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the virtual network gateway connection. |
<!-- END_TF_DOCS -->

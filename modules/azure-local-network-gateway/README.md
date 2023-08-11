<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.69.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_local_network_gateway.remote](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/local_network_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The list of string CIDRs representing the address spaces the gateway exposes. | `list(string)` | `[]` | no |
| <a name="input_bgp_settings"></a> [bgp\_settings](#input\_bgp\_settings) | The Local Network Gateway's BGP speaker settings. | <pre>list(object({<br>    asn                 = number<br>    bgp_peering_address = string<br>    peer_weight         = optional(number)<br>  }))</pre> | `[]` | no |
| <a name="input_gateway"></a> [gateway](#input\_gateway) | gateway\_address - The gateway IP address to connect with.<br>gateway\_fqdn - The gateway FQDN to connect with. | <pre>object({<br>    address = optional(string)<br>    fqdn    = optional(string)<br>  })</pre> | <pre>{<br>  "address": null,<br>  "fqdn": null<br>}</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | The location in which this network security group will be provisioned. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the connection. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which this resource will be provisioned. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A set of tags applied to this resource. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Local Network Gateway. |
<!-- END_TF_DOCS -->

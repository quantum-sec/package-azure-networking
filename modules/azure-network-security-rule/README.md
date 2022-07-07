<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.10.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_rule.rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access"></a> [access](#input\_access) | Specifies whether network traffic is allowed or denied. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | A description for this rule. | `string` | `null` | no |
| <a name="input_destination_address"></a> [destination\_address](#input\_destination\_address) | destination\_address\_prefix - CIDR or destination IP range or `*` to match any IP. Tags such as `VirtualNetwork`, `AzureLoadBalancer` and `Internet` can also be used.<br>destination\_address\_prefixes - List of destination address prefixes. Tags may not be used. | <pre>object({<br>    prefix   = optional(string)<br>    prefixes = optional(set(string))<br>  })</pre> | n/a | yes |
| <a name="input_destination_application_security_group_ids"></a> [destination\_application\_security\_group\_ids](#input\_destination\_application\_security\_group\_ids) | List of destination Application Security Group ID's. | `set(string)` | `null` | no |
| <a name="input_destination_port"></a> [destination\_port](#input\_destination\_port) | destination\_port\_range - Destination Port or Range. Integer or range between `0` and `65535` or `*` to match any.<br>destination\_port\_ranges - List of destination ports or port ranges. | <pre>object({<br>    range  = optional(string)<br>    ranges = optional(set(string))<br>  })</pre> | n/a | yes |
| <a name="input_direction"></a> [direction](#input\_direction) | Specifies whether the rule will be evaluated on incoming or outgoing traffic. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the network security rule. | `string` | n/a | yes |
| <a name="input_network_security_group_name"></a> [network\_security\_group\_name](#input\_network\_security\_group\_name) | The name of the network security group to which this rule will be attached. | `string` | n/a | yes |
| <a name="input_priority"></a> [priority](#input\_priority) | Specifies the priority of the rule. | `number` | n/a | yes |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | The network protocol to which this rule applies. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which this resource will be provisioned. | `string` | n/a | yes |
| <a name="input_source_address"></a> [source\_address](#input\_source\_address) | source\_address\_prefix - CIDR or source IP range or `*` to match any IP. Tags such as `VirtualNetwork`, `AzureLoadBalancer` and `Internet` can also be used.<br>source\_address\_prefixes - List of source address prefixes. Tags may not be used. | <pre>object({<br>    prefix   = optional(string)<br>    prefixes = optional(set(string))<br>  })</pre> | n/a | yes |
| <a name="input_source_application_security_group_ids"></a> [source\_application\_security\_group\_ids](#input\_source\_application\_security\_group\_ids) | List of source Application Security Group ID's. | `set(string)` | `null` | no |
| <a name="input_source_port"></a> [source\_port](#input\_source\_port) | source\_port\_range - Source Port or Range. Integer or range between `0` and `65535` or `*` to match any.<br>source\_port\_ranges - List of source ports or port ranges. | <pre>object({<br>    range  = optional(string)<br>    ranges = optional(set(string))<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the network security rule. |
| <a name="output_name"></a> [name](#output\_name) | The name of network security rule. |
<!-- END_TF_DOCS -->

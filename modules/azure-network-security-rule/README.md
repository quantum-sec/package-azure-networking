<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

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
| <a name="input_destination_address_prefix"></a> [destination\_address\_prefix](#input\_destination\_address\_prefix) | CIDR or destination IP range or * to match any IP. | `string` | `null` | no |
| <a name="input_destination_address_prefixes"></a> [destination\_address\_prefixes](#input\_destination\_address\_prefixes) | List of destination address prefixes. | `set(string)` | `null` | no |
| <a name="input_destination_application_security_group_ids"></a> [destination\_application\_security\_group\_ids](#input\_destination\_application\_security\_group\_ids) | List of destination Application Security Group ID's. | `set(string)` | `null` | no |
| <a name="input_destination_port_range"></a> [destination\_port\_range](#input\_destination\_port\_range) | Destination Port or Range. | `string` | `null` | no |
| <a name="input_destination_port_ranges"></a> [destination\_port\_ranges](#input\_destination\_port\_ranges) | List of destination ports or port ranges. | `set(string)` | `null` | no |
| <a name="input_direction"></a> [direction](#input\_direction) | Specifies whether the rule will be evaluated on incoming or outgoing traffic. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the network security rule. | `string` | n/a | yes |
| <a name="input_network_security_group_name"></a> [network\_security\_group\_name](#input\_network\_security\_group\_name) | The name of the network security group to which this rule will be attached. | `string` | n/a | yes |
| <a name="input_priority"></a> [priority](#input\_priority) | Specifies the priority of the rule. | `string` | n/a | yes |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | The network protocol to which this rule applies. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which this resource will be provisioned. | `string` | n/a | yes |
| <a name="input_source_address_prefix"></a> [source\_address\_prefix](#input\_source\_address\_prefix) | CIDR or source IP range or * to match any IP. | `string` | `null` | no |
| <a name="input_source_address_prefixes"></a> [source\_address\_prefixes](#input\_source\_address\_prefixes) | List of source address prefixes. | `set(string)` | `null` | no |
| <a name="input_source_application_security_group_ids"></a> [source\_application\_security\_group\_ids](#input\_source\_application\_security\_group\_ids) | List of source Application Security Group ID's. | `set(string)` | `null` | no |
| <a name="input_source_port_range"></a> [source\_port\_range](#input\_source\_port\_range) | Source Port or Range. | `string` | `null` | no |
| <a name="input_source_port_ranges"></a> [source\_port\_ranges](#input\_source\_port\_ranges) | List of source ports or port ranges. | `set(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the network security rule. |
<!-- END_TF_DOCS -->

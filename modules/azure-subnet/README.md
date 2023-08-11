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
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_prefixes"></a> [address\_prefixes](#input\_address\_prefixes) | A set of CIDR blocks associated with this subnet. | `list(string)` | n/a | yes |
| <a name="input_delegation"></a> [delegation](#input\_delegation) | Delegation configuration for Azure Network Subnet. | <pre>list(object({<br>    name = string<br>    service_delegation = list(object({<br>      name    = string<br>      actions = optional(list(string))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_enforce_private_link_endpoint_network_policies"></a> [enforce\_private\_link\_endpoint\_network\_policies](#input\_enforce\_private\_link\_endpoint\_network\_policies) | Enable or Disable network policies for the private link endpoint on the subnet. | `bool` | `null` | no |
| <a name="input_enforce_private_link_service_network_policies"></a> [enforce\_private\_link\_service\_network\_policies](#input\_enforce\_private\_link\_service\_network\_policies) | Enable or Disable network policies for the private link service on the subnet. | `bool` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the virtual network gateway. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which this resource will be provisioned. | `string` | n/a | yes |
| <a name="input_service_endpoint_policy_ids"></a> [service\_endpoint\_policy\_ids](#input\_service\_endpoint\_policy\_ids) | The list of IDs of Service Endpoint Policies to associate with the subnet. | `set(string)` | `null` | no |
| <a name="input_service_endpoints"></a> [service\_endpoints](#input\_service\_endpoints) | The list of Service endpoints to associate with the subnet. | `list(string)` | `[]` | no |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | The name of the virtual network in which this resource will be provisioned. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_address_prefixes"></a> [address\_prefixes](#output\_address\_prefixes) | The CIDR blocks associated with this subnet. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the subnet. |
| <a name="output_name"></a> [name](#output\_name) | The name of the subnet. |
<!-- END_TF_DOCS -->

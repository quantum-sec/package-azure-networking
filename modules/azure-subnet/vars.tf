variable "name" {
  description = "The name of the virtual network gateway."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which this resource will be provisioned."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network in which this resource will be provisioned."
  type        = string
}

variable "address_prefixes" {
  description = "A set of CIDR blocks associated with this subnet."
  type        = set(string)
}

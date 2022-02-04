variable "name" {
  description = "The name of the connection."
  type        = string
}

variable "location" {
  description = "The location in which this network security group will be provisioned."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which this resource will be provisioned."
  type        = string
}

variable "remote_gateway_address" {
  description = "The public IP address of the remote gateway. (Either `remote_gateway_address` or `remote_gateway_fqdn` are required)."
  type        = string
  default     = null
}

variable "remote_gateway_fqdn" {
  description = "The FQDN of the remote gateway. (Either `remote_gateway_address` or `remote_gateway_fqdn` are required)."
  type        = string
  default     = null
}

variable "remote_address_space" {
  description = "The set of CIDRs representing the address spaces the gateway exposes."
  type        = set(string)
}

variable "virtual_network_gateway_id" {
  description = "The ID of the virtual network gateway to which this connection is being made."
  type        = string
}

variable "connection_protocol" {
  description = "The IKE protocol version to use. (One of `IKEv1` or `IKEv2`)."
  type        = string
  default     = "IKEv2"
}

variable "tags" {
  description = "A set of tags applied to this resource."
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "The name of the connection."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which this resource will be provisioned."
  type        = string
}

variable "location" {
  description = "The location in which this network security group will be provisioned."
  type        = string
}

variable "address_space" {
  description = "The list of string CIDRs representing the address spaces the gateway exposes."
  type        = list(string)
  default     = []
}

variable "bgp_settings" {
  description = "The Local Network Gateway's BGP speaker settings."
  type = list(object({
    asn                 = number
    bgp_peering_address = string
    peer_weight         = optional(number)
  }))
  default = []
}

# This is required if `gateway_fqdn` is not specified.
variable "gateway_address" {
  description = "The gateway IP address to connect with."
  type        = string
  default     = null
}

# This is required if `gateway_address` is not specified.
variable "gateway_fqdn" {
  description = "The gateway FQDN to connect with."
  type        = string
  default     = null
}

variable "tags" {
  description = "A set of tags applied to this resource."
  type        = map(string)
  default     = {}
}

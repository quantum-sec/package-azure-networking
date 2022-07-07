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

variable "gateway" {
  description = <<EOF
gateway_address - The gateway IP address to connect with.
gateway_fqdn - The gateway FQDN to connect with.
EOF
  type = object({
    address = optional(string)
    fqdn    = optional(string)
  })
  default = {
    address = null
    fqdn    = null
  }
  validation {
    condition     = !(var.gateway.address == null && var.gateway.fqdn == null)
    error_message = "Either of \"gateway_address\" or \"gateway_fqdn\" is required if the other is not specified."
  }
}

variable "tags" {
  description = "A set of tags applied to this resource."
  type        = map(string)
  default     = {}
}

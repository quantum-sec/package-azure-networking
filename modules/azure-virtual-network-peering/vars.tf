variable "name" {
  description = "The name of the virtual network peering connection."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the local virtual network."
  type        = string
}

variable "remote_virtual_network_id" {
  description = "The ID of the remote virtual network."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which this resource will be provisioned."
  type        = string
}

variable "allow_virtual_network_access" {
  description = "Whether or not clients in the remote virtual network can access clients in the local virtual network."
  type        = bool
  default     = true
}

variable "allow_forwarded_traffic" {
  description = "Whether or not forwarded traffic from clients in the remote virtual network is allowed."
  type        = bool
  default     = false
}

variable "allow_gateway_transit" {
  description = "Whether or not gateway links can be used in the remote virtual network's link to the local network."
  type        = bool
  default     = null
}

variable "use_remote_gateways" {
  description = "Wehther or not remote gateways can be used on the local virtual network."
  type        = bool
  default     = false
}

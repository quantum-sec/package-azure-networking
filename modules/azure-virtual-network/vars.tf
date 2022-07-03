variable "name" {
  description = "The name to assign to the virtual network."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which this virtual network will be provisioned."
  type        = string
}

variable "address_space" {
  description = "A set of CIDR notation subnets assigned to this virtual network."
  type        = list(string)
}

variable "location" {
  description = "The Azure region in which this virtual network will be deployed."
  type        = string
}

variable "bgp_community" {
  description = "The BGP community attribute in format <as-number>:<community-value>."
  type        = string
  default     = null
}

variable "ddos_protection_plan" {
  description = "The DDoS protection plan associated with this virtual network."
  type = list(object({
    id     = string
    enable = bool
  }))
  default = []
}

variable "dns_servers" {
  description = "List of IP addresses of DNS servers."
  type        = list(string)
  default     = []
}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Virtual Network should exist."
  type        = string
  default     = null
}

variable "flow_timeout_in_minutes" {
  description = "The flow timeout in minutes for the Virtual Network, which is used to enable connection tracking for intra-VM flows."
  type        = number
  default     = null
  validation {
    condition = var.flow_timeout_in_minutes == null ? true : (
      var.flow_timeout_in_minutes >= 4 && var.flow_timeout_in_minutes <= 30
    )
    error_message = "Possible values are between 4 and 30 minutes."
  }
}

variable "tags" {
  description = "A set of tags applied to this resource."
  type        = map(string)
  default     = {}
}

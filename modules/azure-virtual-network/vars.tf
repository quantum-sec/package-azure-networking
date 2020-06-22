variable "location" {
  description = "The Azure region in which this virtual network will be deployed."
  type        = string
}

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
  type        = set(string)
}

variable "dns_servers" {
  description = "A list of DNS servers on the virtual network. These will be provided to DHCP clients on this network."
  type        = set(string)
}

variable "ddos_protection_plan_id" {
  description = "The ID of the DDoS protection plan associated with this virtual network."
  type        = string
  default     = null
}

variable "subnets" {
  description = "A set of subnets to create within the address space of this virtual network."
  type = set(object({
    name              = string
    address_prefix    = string
    security_group_id = string
  }))
  default = []
}

variable "tags" {
  description = "A set of tags applied to this resource."
  type        = map(string)
  default     = {}
}

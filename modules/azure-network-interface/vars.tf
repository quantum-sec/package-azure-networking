variable "name" {
  description = "The name of the network interface."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which this resource will be provisioned."
  type        = string
}

variable "location" {
  description = "The location where the Network Interface will be provisioned."
  type        = string
}

variable "ip_name" {
  description = "The name of the IP configuration."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where this network interface will be located."
  type        = string
}

variable "private_ip_address_allocation" {
  description = "The allocation method used for the Private IP Address."
  type        = string
}

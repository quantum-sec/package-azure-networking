variable "name" {
  description = "The name of the network security group."
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

variable "tags" {
  description = "A set of tags applied to this resource."
  type        = map(string)
  default     = {}
}

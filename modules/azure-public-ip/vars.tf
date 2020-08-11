variable "name" {
  description = "The name of the public IP deployment resource."
  type        = string
}

variable "location" {
  description = "The location in which this public IP will be provisioned."
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

variable "allocation_method" {
  description = "The default allocation method assigned to this IP address."
  type        = string
  default     = "static"
}

variable "sku" {
  description = "The SKU of the Public IP. one of `Basic` or `Standard` "
  type        = string
  default     = "Standard"
}

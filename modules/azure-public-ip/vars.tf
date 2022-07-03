variable "name" {
  description = "The name of the public IP deployment resource."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which this resource will be provisioned."
  type        = string
}

variable "location" {
  description = "The location in which this public IP will be provisioned."
  type        = string
}

variable "allocation_method" {
  description = "The default allocation method assigned to this IP address."
  type        = string
  validation {
    condition     = var.allocation_method == "Static" || var.allocation_method == "Dynamic"
    error_message = "Possible values are \"Static\" or \"Dynamic\"."
  }
}

variable "zones" {
  description = "A collection containing the availability zone to allocate the Public IP in."
  type        = list(string)
  default     = []
}

variable "domain_name_label" {
  description = "Label for the Domain Name."
  type        = string
  default     = null
}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Public IP should exist."
  type        = string
  default     = null
}

variable "idle_timeout_in_minutes" {
  description = "Specifies the timeout for the TCP idle connection."
  type        = number
  default     = null
  validation {
    condition = var.idle_timeout_in_minutes == null ? true : (
      var.idle_timeout_in_minutes >= 4 && var.idle_timeout_in_minutes <= 30
    )
    error_message = "The value can be set between 4 and 30 minutes."
  }
}

variable "ip_tags" {
  description = "A mapping of IP tags to assign to the public IP."
  type        = map(string)
  default     = {}
}

variable "ip_version" {
  description = "The IP Version to use."
  type        = string
  default     = null
  validation {
    condition = anytrue([
      var.ip_version == "IPv4",
      var.ip_version == "IPv6",
      var.ip_version == null
    ])
    error_message = "Possible values are \"IPv4\" or \"IPv6\"."
  }
}

variable "public_ip_prefix_id" {
  description = "If specified then public IP address allocated will be provided from the public IP prefix resource."
  type        = string
  default     = null
}

variable "reverse_fqdn" {
  description = "A fully qualified domain name that resolves to this public IP address."
  type        = string
  default     = null
}

variable "sku" {
  description = "The SKU of the Public IP."
  type        = string
  default     = null
  validation {
    condition = anytrue([
      var.sku == "Basic",
      var.sku == "Standard",
      var.sku == null
    ])
    error_message = "Accepted values are \"Basic\" and \"Standard\"."
  }
}

variable "sku_tier" {
  description = "The SKU Tier that should be used for the Public IP."
  type        = string
  default     = null
  validation {
    condition = anytrue([
      var.sku_tier == "Regional",
      var.sku_tier == "Global",
      var.sku_tier == null
    ])
    error_message = "Possible values are \"Regional\" and \"Global\"."
  }
}

variable "tags" {
  description = "A set of tags applied to this resource."
  type        = map(string)
  default     = {}
}

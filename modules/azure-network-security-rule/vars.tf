variable "name" {
  description = "The name of the network security rule."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which this resource will be provisioned."
  type        = string
}

variable "network_security_group_name" {
  description = "The name of the network security group to which this rule will be attached."
  type        = string
}

variable "description" {
  description = "A description for this rule."
  type        = string
  default     = null
  validation {
    condition     = var.description == null ? true : length(var.description) <= 140
    error_message = "Restricted to 140 characters."
  }
}

variable "protocol" {
  description = "The network protocol to which this rule applies."
  type        = string
  validation {
    condition = anytrue([
      var.protocol == "Tcp",
      var.protocol == "Udp",
      var.protocol == "Icmp",
      var.protocol == "Esp",
      var.protocol == "Ah",
      var.protocol == "*"
    ])
    error_message = "Possible values include \"Tcp\", \"Udp\", \"Icmp\", \"Esp\", \"Ah\" or \"*\"."
  }
}

variable "access" {
  description = "Specifies whether network traffic is allowed or denied."
  type        = string
  validation {
    condition     = var.access == "Allow" || var.access == "Deny"
    error_message = "Possible values are \"Allow\" and \"Deny\"."
  }
}

variable "priority" {
  description = "Specifies the priority of the rule."
  type        = number
  validation {
    condition     = var.priority >= 100 && var.priority <= 4096
    error_message = "The value must be between 100 and 4096."
  }
}

variable "direction" {
  description = "Specifies whether the rule will be evaluated on incoming or outgoing traffic."
  type        = string
  validation {
    condition     = var.direction == "Inbound" || var.direction == "Outbound"
    error_message = "Possible values are \"Inbound\" and \"Outbound\"."
  }
}

variable "source_port" {
  description = <<EOF
source_port_range - Source Port or Range. Integer or range between `0` and `65535` or `*` to match any.
source_port_ranges - List of source ports or port ranges.
EOF
  type = object({
    range  = optional(string)
    ranges = optional(set(string))
  })
  validation {
    condition     = !(var.source_port.range == null && var.source_port.ranges == null)
    error_message = "Either of \"source_port_range\" or \"source_port_ranges\" is required if the other is not specified."
  }
  validation {
    condition     = !(var.source_port.range != null && var.source_port.ranges != null)
    error_message = "\"source_port_range\" and \"source_port_ranges\" are mutually exclusive."
  }
}

variable "source_address" {
  description = <<EOF
source_address_prefix - CIDR or source IP range or `*` to match any IP. Tags such as `VirtualNetwork`, `AzureLoadBalancer` and `Internet` can also be used.
source_address_prefixes - List of source address prefixes. Tags may not be used.
EOF
  type = object({
    prefix   = optional(string)
    prefixes = optional(set(string))
  })
  validation {
    condition     = !(var.source_address.prefix == null && var.source_address.prefixes == null)
    error_message = "Either of \"source_address_prefix\" or \"source_address_prefixes\" is required if the other is not specified."
  }
  validation {
    condition     = !(var.source_address.prefix != null && var.source_address.prefixes != null)
    error_message = "\"source_address_prefix\" and \"source_address_prefixes\" are mutually exclusive."
  }
}

variable "source_application_security_group_ids" {
  description = "List of source Application Security Group ID's."
  type        = set(string)
  default     = null
}

variable "destination_port" {
  description = <<EOF
destination_port_range - Destination Port or Range. Integer or range between `0` and `65535` or `*` to match any.
destination_port_ranges - List of destination ports or port ranges.
EOF
  type = object({
    range  = optional(string)
    ranges = optional(set(string))
  })
  validation {
    condition     = !(var.destination_port.range == null && var.destination_port.ranges == null)
    error_message = "Either of \"destination_port_range\" or \"destination_port_ranges\" is required if the other is not specified."
  }
  validation {
    condition     = !(var.destination_port.range != null && var.destination_port.ranges != null)
    error_message = "\"destination_port_range\" and \"destination_port_ranges\" are mutually exclusive."
  }
}

variable "destination_address" {
  description = <<EOF
destination_address_prefix - CIDR or destination IP range or `*` to match any IP. Tags such as `VirtualNetwork`, `AzureLoadBalancer` and `Internet` can also be used.
destination_address_prefixes - List of destination address prefixes. Tags may not be used.
EOF
  type = object({
    prefix   = optional(string)
    prefixes = optional(set(string))
  })
  validation {
    condition     = !(var.destination_address.prefix == null && var.destination_address.prefixes == null)
    error_message = "Either of \"destination_address_prefix\" or \"destination_address_prefixes\" is required if the other is not specified."
  }
  validation {
    condition     = !(var.destination_address.prefix != null && var.destination_address.prefixes != null)
    error_message = "\"destination_address_prefix\" and \"destination_address_prefixes\" are mutually exclusive."
  }
}

variable "destination_application_security_group_ids" {
  description = "List of destination Application Security Group ID's."
  type        = set(string)
  default     = null
}

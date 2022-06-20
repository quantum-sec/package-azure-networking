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
}

variable "protocol" {
  description = "The network protocol to which this rule applies."
  type        = string
}

variable "access" {
  description = "Specifies whether network traffic is allowed or denied."
  type        = string
}

variable "priority" {
  description = "Specifies the priority of the rule."
  type        = string
}

variable "direction" {
  description = "Specifies whether the rule will be evaluated on incoming or outgoing traffic."
  type        = string
}

# This is required if `source_port_ranges` is not specified.
variable "source_port_range" {
  description = "Source Port or Range."
  type        = string
  default     = null
}

# This is required if `source_port_range` is not specified.
variable "source_port_ranges" {
  description = "List of source ports or port ranges."
  type        = set(string)
  default     = null
}

# This is required if `source_address_prefixes` is not specified.
variable "source_address_prefix" {
  description = "CIDR or source IP range or * to match any IP."
  type        = string
  default     = null
}

# This is required if `source_address_prefix` is not specified.
variable "source_address_prefixes" {
  description = "List of source address prefixes."
  type        = set(string)
  default     = null
}

variable "source_application_security_group_ids" {
  description = "List of source Application Security Group ID's."
  type        = set(string)
  default     = null
}

# This is required if `destination_port_ranges` is not specified.
variable "destination_port_range" {
  description = "Destination Port or Range."
  type        = string
  default     = null
}

# This is required if `destination_port_range` is not specified.
variable "destination_port_ranges" {
  description = "List of destination ports or port ranges."
  type        = set(string)
  default     = null
}

# This is required if `destination_address_prefixes` is not specified.
variable "destination_address_prefix" {
  description = "CIDR or destination IP range or * to match any IP."
  type        = string
  default     = null
}

# This is required if `destination_address_prefix` is not specified.
variable "destination_address_prefixes" {
  description = "List of destination address prefixes."
  type        = set(string)
  default     = null
}

variable "destination_application_security_group_ids" {
  description = "List of destination Application Security Group ID's."
  type        = set(string)
  default     = null
}

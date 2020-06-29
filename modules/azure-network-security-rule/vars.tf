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
  description = "A description for this rule. Restricted to 140 characters."
  type        = string
  default     = ""
}

variable "protocol" {
  description = "The network protocol to which this rule applies. One of `Tcp`, `Udp`, `Icmp`, or `*` which matches all."
  type        = string
}

variable "access" {
  description = "Specifies whether network traffic is allowed or denied. One of `Allow` or `Deny`."
  type        = string
}

variable "priority" {
  description = "Specifies the priority of the rule. Any integer between `100` and `4096`. The lower the number, the higher the priority of the rule."
  type        = string
}

variable "direction" {
  description = "Specifies whether the rule will be evaluated on incoming or outgoing traffic. One of `Inbound` or `Outbound`."
  type        = string
  default     = "Inbound"
}

variable "source_port_ranges" {
  description = "A set of source ports or port ranges, each being an integer between `0` and `65535` or `*` to match any port."
  type        = set(string)
}

variable "source_address_prefixes" {
  description = "A list of source addresses, each being a CIDR block, `*` to match any IP, or tags such as `VirtualNetwork`, `AzureLoadBalancer`, or `Internet`."
  type        = set(string)
}

variable "source_application_security_group_ids" {
  description = "A set of source Application Security Group IDs."
  type        = set(string)
}

variable "destination_port_ranges" {
  description = "A set of destination ports or port ranges, each being an integer between `0` and `65535` or `*` to match any port."
  type        = set(string)
}

variable "destination_address_prefixes" {
  description = "A set of destination addresses, each being a CIDR block, `*` ro match any IP, or tags such as `VirtualNetwork`, `AzureLoadBlaancer`, or `Internat`."
  type        = set(string)
}

variable "destination_application_security_group_ids" {
  description = "A set of destination Application Security Group IDs."
  type        = set(string)
}

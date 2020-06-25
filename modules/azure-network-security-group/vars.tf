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

variable "priority" {
  description = "Specifies the priority of the rule. The value has to be unique and must be between 100 and 4096."
  type        = number
}

variable "direction" {
  description = "The direction specifies if rule will be evaluated on incoming or outgoing traffic. One of `Inbound` or `Outbound`."
  type        = string
}

variable "access" {
  description = "Specifies whether network traffic is allowed or denied. One of `Allow` and `Deny`."
  type        = string
}

variable "protocol" {
  description = "Network protocol this rule applies to. One of `Tcp`, `Udp`, `Icmp` or `*`."
  type        = string
}

variable "source_port_range" {
  description = "Source Port or Range. Integer or range between `0 & 65535` or `*`."
  type        = string
}

variable "destination_port_range" {
  description = "Destination Port or Range. Integer or range between `0 & 65535` or `*`."
  type        = string
}

variable "source_address_prefix" {
  description = "CIDR or source IP range or * to match any IP. Also, one of `VirtualNetwork`, `AzureLoadBalancer` or `Internet` can be used."
  type        = string
}

variable "destination_address_prefix" {
  description = "CIDR or destination IP range or * to match any IP. Also, one of `VirtualNetwork`, `AzureLoadBalancer` or `Internet` can be used."
  type        = string
}

variable "tags" {
  description = "A set of tags applied to this resource."
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "The name of the virtual network gateway."
  type        = string
}

variable "location" {
  description = "The location in which this virtual network gateway will be provisioned."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which this resource will be provisioned."
  type        = string
}

variable "gateway_subnet_id" {
  description = "The ID of the subnet used as the gateway subnet. This subnet must be named exactly `GatewaySubnet`."
  type        = string
}

variable "sku" {
  description = "Configuration of the size and capacity of the virtual network gateway."
  type        = string
  default     = "Basic"
}

variable "type" {
  description = "The type of virtual network gateway. One of `Vpn` or `ExpressRoute`."
  type        = string
}

variable "vpn_type" {
  description = "The routing type of the virtual network gateway. One of `RouteBased` or `PolicyBased`."
  type        = string
}

variable "enable_bgp" {
  description = "Enable BGP for this virtual network gateway."
  type        = bool
  default     = false
}

variable "default_local_network_gateway_id" {
  description = "The ID of the local network gateway through which outbound Internet traffic from the virtual network in which the gateway is created will be routed (forced tunneling)."
  type        = string
  default     = null
}

variable "private_ip_address_allocation" {
  description = "Defines how the private IP address of the gateway's virtual interface is assigned. One of `Static` or `Dynamic`."
  type        = string
  default     = "Dynamic"
}

variable "public_ip_address_allocation" {
  description = "Defines how the public IP address of the gateway's virtual interface is assigned. One of `Static` or `Dynamic`."
  type        = string
  default     = "Static"
}

variable "vpn_address_space" {
  description = "The set of CIDR blocks out of which IP addresses for VPN clients will be assigned."
  type        = set(string)
}

variable "vpn_root_certificate_name" {
  description = "The name of the VPN root certificate."
  type        = string
}

variable "vpn_root_certificate_data" {
  description = "The public certificate of the root certificate authority. The certificate must be provided in base64-encoded X.509 (PEM) format."
  type        = string
}

variable "vpn_client_protocols" {
  description = "A set of protocols supported by the VPN client. Any of `SSTP`, `IkeV2`, and `OpenVPN`."
  type        = set(string)
}

variable "bgp_asn" {
  description = "The ASN to use for the BGP configuration."
  type        = number
}

variable "bgp_peering_address" {
  description = "The BGP peer IP address of the virtual network gateway."
  type        = string
}

variable "bgp_peer_weight" {
  description = "The weight added to routes which ahve been learned through BGP peering. (A number between 0 and 100)."
  type        = number
}

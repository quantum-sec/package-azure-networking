variable "ip_configuration" {
  description = "IP configuration for the virtual network gateway."
  type = list(object({
    name                          = optional(string)
    private_ip_address_allocation = optional(string)
    subnet_id                     = string
    public_ip_address_id          = string
  }))
  validation {
    condition = alltrue([
      for ip_config in var.ip_configuration : (
        lookup(ip_config, "private_ip_address_allocation", null) == null ? true : anytrue([
          ip_config["private_ip_address_allocation"] == "Static",
          ip_config["private_ip_address_allocation"] == "Dynamic"
        ])
      )
    ])
    error_message = "Valid options for `ip_configuration.private_ip_address_allocation` are \"Static\" or \"Dynamic\"."
  }
}

variable "location" {
  description = "The location in which this virtual network gateway will be provisioned."
  type        = string
}

variable "name" {
  description = "The name of the virtual network gateway."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which this resource will be provisioned."
  type        = string
}

variable "sku" {
  description = "Configuration of the size and capacity of the virtual network gateway."
  type        = string
  validation {
    condition = anytrue([
      var.sku == "Basic",
      var.sku == "Standard",
      var.sku == "HighPerformance",
      var.sku == "UltraPerformance",
      var.sku == "ErGw1AZ",
      var.sku == "ErGw2AZ",
      var.sku == "ErGw3AZ",
      var.sku == "VpnGw1",
      var.sku == "VpnGw2",
      var.sku == "VpnGw3",
      var.sku == "VpnGw4",
      var.sku == "VpnGw5",
      var.sku == "VpnGw1AZ",
      var.sku == "VpnGw2AZ",
      var.sku == "VpnGw3AZ",
      var.sku == "VpnGw4AZ",
      var.sku == "VpnGw5AZ"
    ])
    error_message = "Valid options are \"Basic\", \"Standard\", \"HighPerformance\", \"UltraPerformance\", \"ErGw1AZ\", \"ErGw2AZ\", \"ErGw3AZ\", \"VpnGw1\", \"VpnGw2\", \"VpnGw3\", \"VpnGw4\", \"VpnGw5\", \"VpnGw1AZ\", \"VpnGw2AZ\", \"VpnGw3AZ\", \"VpnGw4AZ\" and \"VpnGw5AZ\"."
  }
}

variable "type" {
  description = "The type of virtual network gateway."
  type        = string
  validation {
    condition     = var.type == "Vpn" || var.type == "ExpressRoute"
    error_message = "Valid options are \"Vpn\" or \"ExpressRoute\"."
  }
}

variable "active_active" {
  description = "If `true`, an active-active Virtual Network Gateway will be created. If `false`, an active-standby gateway will be created."
  type        = bool
  default     = null
}

variable "default_local_network_gateway_id" {
  description = "The ID of the local network gateway through which outbound Internet traffic from the virtual network in which the gateway is created will be routed (forced tunneling)."
  type        = string
  default     = null
}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Virtual Network Gateway should exist."
  type        = string
  default     = null
}

variable "enable_bgp" {
  description = "Enable BGP for this virtual network gateway."
  type        = bool
  default     = null
}

variable "bgp_settings" {
  description = "BGP settings for this virtual network gateway."
  type = list(object({
    asn = optional(number)
    peering_addresses = optional(list(object({
      ip_configuration_name = optional(string)
      apipa_addresses       = optional(list(string))
    })))
    peer_weight = optional(number)
  }))
  default = []
  validation {
    condition = alltrue([
      for bgp_setting in var.bgp_settings : (
        lookup(bgp_setting, "peer_weight", null) == null ? true : (
          bgp_setting["peer_weight"] >= 0 && bgp_setting["peer_weight"] <= 100
        )
      )
    ])
    error_message = "Valid values for `peer_weight` can be between 0 and 100."
  }
}

variable "generation" {
  description = "The Generation of the Virtual Network gateway."
  type        = string
  default     = null
  validation {
    condition = anytrue([
      var.generation == "Generation1",
      var.generation == "Generation2",
      var.generation == "None",
      var.generation == null
    ])
    error_message = "Possible values include \"Generation1\", \"Generation2\" or \"None\"."
  }
}

variable "private_ip_address_enabled" {
  description = "Should private IP be enabled on this gateway for connections."
  type        = bool
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "vpn_client_configuration" {
  description = "The VPN client configuration of the virtual network gateway"
  type = list(object({
    address_space = list(string)
    aad_tenant    = optional(string)
    aad_audience  = optional(string)
    aad_issuer    = optional(string)
    root_certificate = optional(list(object({
      name             = string
      public_cert_data = string
    })))
    revoked_certificate = optional(list(object({
      name       = string
      thumbprint = string
    })))
    radius_server_address = optional(string)
    radius_server_secret  = optional(string)
    vpn_client_protocols  = optional(set(string))
    vpn_auth_types        = optional(set(string))
  }))
  default = []
  validation {
    condition = alltrue([
      for vpn_client_config in var.vpn_client_configuration : (
        lookup(vpn_client_config, "vpn_client_protocols", null) == null ? true : alltrue([
          for vpn_client_protocol in vpn_client_config["vpn_client_protocols"] : anytrue([
            vpn_client_protocol == "SSTP",
            vpn_client_protocol == "IkeV2",
            vpn_client_protocol == "OpenVPN"
          ])
        ])
      )
    ])
    error_message = "The supported values for `vpn_client_configuration.vpn_client_protocols` are \"SSTP\", \"IkeV2\" and \"OpenVPN\"."
  }
  validation {
    condition = alltrue([
      for vpn_client_config in var.vpn_client_configuration : (
        lookup(vpn_client_config, "vpn_auth_types", null) == null ? true : anytrue([
          vpn_client_config["vpn_auth_types"] == "AAD",
          vpn_client_config["vpn_auth_types"] == "Radius",
          vpn_client_config["vpn_auth_types"] == "Certificate"
        ])
      )
    ])
    error_message = "The supported values for `vpn_client_configuration.vpn_auth_types` are \"AAD\", \"Radius\" and \"Certificate\"."
  }
}

variable "vpn_type" {
  description = "The routing type of the virtual network gateway."
  type        = string
  default     = null
  validation {
    condition = anytrue([
      var.vpn_type == "RouteBased",
      var.vpn_type == "PolicyBased",
      var.vpn_type == null
    ])
    error_message = "Valid options are \"RouteBased\" or \"PolicyBased\"."
  }
}

variable "name" {
  description = "The name of the connection."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which this resource will be provisioned."
  type        = string
}

variable "location" {
  description = "The location in which this network security group will be provisioned."
  type        = string
}

variable "type" {
  description = "The type of connection."
  type        = string
  validation {
    condition = anytrue([
      var.type == "IPsec",
      var.type == "ExpressRoute",
      var.type == "Vnet2Vnet"
    ])
    error_message = "Valid options are \"IPsec\" (Site-to-Site), \"ExpressRoute\" (ExpressRoute), and \"Vnet2Vnet\" (VNet-to-VNet)."
  }
}

variable "virtual_network_gateway_id" {
  description = "The ID of the virtual network gateway to which this connection is being made."
  type        = string
}

variable "authorization_key" {
  description = "The authorization key associated with the Express Route Circuit."
  type        = string
  default     = null
}

variable "dpd_timeout_seconds" {
  description = "The dead peer detection timeout of this connection in seconds."
  type        = number
  default     = null
}

variable "express_route_circuit_id" {
  description = "The ID of the Express Route Circuit when creating an ExpressRoute connection."
  type        = string
  default     = null
}

variable "peer_virtual_network_gateway_id" {
  description = "The ID of the peer virtual network gateway when creating a VNet-to-VNet connection."
  type        = string
  default     = null
}

variable "local_azure_ip_address_enabled" {
  description = "Use private local Azure IP for the connection."
  type        = bool
  default     = null
}

variable "local_network_gateway_id" {
  description = "The ID of the local network gateway when creating Site-to-Site connection."
  type        = string
  default     = null
}

variable "routing_weight" {
  description = "The routing weight."
  type        = number
  default     = null
}

variable "shared_key" {
  description = "The shared IPSec key."
  type        = string
  default     = null
}

variable "connection_mode" {
  description = "Connection mode to use."
  type        = string
  default     = null
  validation {
    condition = anytrue([
      var.connection_mode == "Default",
      var.connection_mode == "InitiatorOnly",
      var.connection_mode == "ResponderOnly",
      var.connection_mode == null
    ])
    error_message = "Possible values are \"Default\", \"InitiatorOnly\" and \"ResponderOnly\"."
  }
}

variable "connection_protocol" {
  description = "The IKE protocol version to use."
  type        = string
  default     = null
  validation {
    condition = var.connection_protocol == null ? true : (
      var.connection_protocol == "IKEv1" || var.connection_protocol == "IKEv2"
    )
    error_message = "Possible values are \"IKEv1\" and \"IKEv2\"."
  }
}

variable "enable_bgp" {
  description = "BGP (Border Gateway Protocol) is enabled for this connection."
  type        = bool
  default     = null
}

variable "custom_bgp_addresses" {
  description = "Custom BGP Addresses."
  type = list(object({
    primary   = string
    secondary = string
  }))
  default = []
}

variable "express_route_gateway_bypass" {
  description = "If enabled data packets will bypass ExpressRoute Gateway for data forwarding."
  type        = bool
  default     = null
}

variable "egress_nat_rule_ids" {
  description = "A list of the egress NAT Rule Ids."
  type        = list(string)
  default     = null
}

variable "ingress_nat_rule_ids" {
  description = "A list of the ingress NAT Rule Ids."
  type        = list(string)
  default     = null
}

variable "use_policy_based_traffic_selectors" {
  description = "Policy-based traffic selectors are enabled for this connection."
  type        = bool
  default     = null
}

variable "ipsec_policy" {
  description = "IPSec policy for Gateway connection."
  type = list(object({
    dh_group         = string
    ike_encryption   = string
    ike_integrity    = string
    ipsec_encryption = string
    ipsec_integrity  = string
    pfs_group        = string
    sa_datasize      = optional(number)
    sa_lifetime      = optional(number)
  }))
  default = []
  validation {
    condition = alltrue([
      for ipsec in var.ipsec_policy : anytrue([
        ipsec["dh_group"] == "DHGroup1",
        ipsec["dh_group"] == "DHGroup14",
        ipsec["dh_group"] == "DHGroup2",
        ipsec["dh_group"] == "DHGroup2048",
        ipsec["dh_group"] == "DHGroup24",
        ipsec["dh_group"] == "ECP256",
        ipsec["dh_group"] == "ECP384",
        ipsec["dh_group"] == "None"
      ])
    ])
    error_message = "Valid options for `dh_group` are \"DHGroup1\", \"DHGroup14\", \"DHGroup2\", \"DHGroup2048\", \"DHGroup24\", \"ECP256\", \"ECP384\", or \"None\"."
  }
  validation {
    condition = alltrue([
      for ipsec in var.ipsec_policy : anytrue([
        ipsec["ike_encryption"] == "AES128",
        ipsec["ike_encryption"] == "AES192",
        ipsec["ike_encryption"] == "AES256",
        ipsec["ike_encryption"] == "DES",
        ipsec["ike_encryption"] == "DES3",
        ipsec["ike_encryption"] == "GCMAES128",
        ipsec["ike_encryption"] == "GCMAES256"
      ])
    ])
    error_message = "Valid options for `ike_encryption` are \"AES128\", \"AES192\", \"AES256\", \"DES\", \"DES3\", \"GCMAES128\", or \"GCMAES256\"."
  }
  validation {
    condition = alltrue([
      for ipsec in var.ipsec_policy : anytrue([
        ipsec["ike_integrity"] == "GCMAES128",
        ipsec["ike_integrity"] == "GCMAES256",
        ipsec["ike_integrity"] == "MD5",
        ipsec["ike_integrity"] == "SHA1",
        ipsec["ike_integrity"] == "SHA256",
        ipsec["ike_integrity"] == "SHA384"
      ])
    ])
    error_message = "Valid options for `ike_integrity` are \"GCMAES128\", \"GCMAES256\", \"MD5\", \"SHA1\", \"SHA256\", or \"SHA384\"."
  }
  validation {
    condition = alltrue([
      for ipsec in var.ipsec_policy : anytrue([
        ipsec["ipsec_encryption"] == "AES128",
        ipsec["ipsec_encryption"] == "AES192",
        ipsec["ipsec_encryption"] == "AES256",
        ipsec["ipsec_encryption"] == "DES",
        ipsec["ipsec_encryption"] == "DES3",
        ipsec["ipsec_encryption"] == "GCMAES128",
        ipsec["ipsec_encryption"] == "GCMAES192",
        ipsec["ipsec_encryption"] == "GCMAES256",
        ipsec["ipsec_encryption"] == "None"
      ])
    ])
    error_message = "Valid options for `ipsec_encryption` are \"AES128\", \"AES192\", \"AES256\", \"DES\", \"DES3\", \"GCMAES128\", \"GCMAES192\", \"GCMAES256\", or \"None\"."
  }
  validation {
    condition = alltrue([
      for ipsec in var.ipsec_policy : anytrue([
        ipsec["ipsec_integrity"] == "GCMAES128",
        ipsec["ipsec_integrity"] == "GCMAES192",
        ipsec["ipsec_integrity"] == "GCMAES256",
        ipsec["ipsec_integrity"] == "MD5",
        ipsec["ipsec_integrity"] == "SHA1",
        ipsec["ipsec_integrity"] == "SHA256"
      ])
    ])
    error_message = "Valid options for `ipsec_integrity` are \"GCMAES128\", \"GCMAES192\", \"GCMAES256\", \"MD5\", \"SHA1\", or \"SHA256\"."
  }
  validation {
    condition = alltrue([
      for ipsec in var.ipsec_policy : anytrue([
        ipsec["pfs_group"] == "ECP256",
        ipsec["pfs_group"] == "ECP384",
        ipsec["pfs_group"] == "PFS1",
        ipsec["pfs_group"] == "PFS14",
        ipsec["pfs_group"] == "PFS2",
        ipsec["pfs_group"] == "PFS2048",
        ipsec["pfs_group"] == "PFS24",
        ipsec["pfs_group"] == "PFSMM",
        ipsec["pfs_group"] == "None"
      ])
    ])
    error_message = "Valid options for `pfs_group` are \"ECP256\", \"ECP384\", \"PFS1\", \"PFS14\", \"PFS2\", \"PFS2048\", \"PFS24\", \"PFSMM\", or \"None\"."
  }
  validation {
    condition = alltrue([
      for ipsec in var.ipsec_policy : (ipsec["sa_datasize"] == null ? true : ipsec["sa_datasize"] >= 1024)
    ])
    error_message = "`sa_datasize` must be at least 1024 KB."
  }
  validation {
    condition = alltrue([
      for ipsec in var.ipsec_policy : (ipsec["sa_lifetime"] == null ? true : ipsec["sa_lifetime"] >= 300)
    ])
    error_message = "`sa_lifetime` must be at least 300 seconds."
  }
}

variable "traffic_selector_policy" {
  description = "Allows to specify a traffic selector policy proposal to be used in a virtual network gateway connection."
  type = list(object({
    local_address_cidrs  = list(string)
    remote_address_cidrs = list(string)
  }))
  default = []
}

variable "tags" {
  description = "A set of tags applied to this resource."
  type        = map(string)
  default     = {}
}

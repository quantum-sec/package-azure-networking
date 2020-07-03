variable "subnet_id" {
  description = "The ID of the subnet to which the Network Security Group rules should be applied."
  type        = string
}

variable "network_security_group_id" {
  description = "The ID of the Network Security Group which should be associated with the subnet."
  type        = string
}

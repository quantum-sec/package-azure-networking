variable "subnet_id" {
  description = "The ID of the Subnet on which Network Security Group rule is to be applied"
  type        = string
}

variable "network_security_group_id" {
  description = "he ID of the Network Security Group which should be associated with the Subnet."
  type        = string
}

variable "name" {
  description = "The name of the virtual network gateway."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which this resource will be provisioned."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network in which this resource will be provisioned."
  type        = string
}

variable "address_prefixes" {
  description = "A set of CIDR blocks associated with this subnet."
  type        = list(string)
  validation {
    condition     = length(var.address_prefixes) == 1
    error_message = "Currently only a single address prefix can be set."
  }
}

variable "delegation" {
  description = "Delegation configuration for Azure Network Subnet."
  type = list(object({
    name = string
    service_delegation = list(object({
      name    = string
      actions = optional(list(string))
    }))
  }))
  default = []
  validation {
    condition = alltrue([
      for dg in var.delegation : alltrue([
        for sdg in dg["service_delegation"] : alltrue([
          anytrue([
            sdg["name"] == "Microsoft.ApiManagement/service",
            sdg["name"] == "Microsoft.AzureCosmosDB/clusters",
            sdg["name"] == "Microsoft.BareMetal/AzureVMware",
            sdg["name"] == "Microsoft.BareMetal/CrayServers",
            sdg["name"] == "Microsoft.Batch/batchAccounts",
            sdg["name"] == "Microsoft.ContainerInstance/containerGroups",
            sdg["name"] == "Microsoft.ContainerService/managedClusters",
            sdg["name"] == "Microsoft.Databricks/workspaces",
            sdg["name"] == "Microsoft.DBforMySQL/flexibleServers",
            sdg["name"] == "Microsoft.DBforMySQL/serversv2",
            sdg["name"] == "Microsoft.DBforPostgreSQL/flexibleServers",
            sdg["name"] == "Microsoft.DBforPostgreSQL/serversv2",
            sdg["name"] == "Microsoft.DBforPostgreSQL/singleServers",
            sdg["name"] == "Microsoft.HardwareSecurityModules/dedicatedHSMs",
            sdg["name"] == "Microsoft.Kusto/clusters",
            sdg["name"] == "Microsoft.Logic/integrationServiceEnvironments",
            sdg["name"] == "Microsoft.MachineLearningServices/workspaces",
            sdg["name"] == "Microsoft.Netapp/volumes",
            sdg["name"] == "Microsoft.Network/managedResolvers",
            sdg["name"] == "Microsoft.PowerPlatform/vnetaccesslinks",
            sdg["name"] == "Microsoft.ServiceFabricMesh/networks",
            sdg["name"] == "Microsoft.Sql/managedInstances",
            sdg["name"] == "Microsoft.Sql/servers",
            sdg["name"] == "Microsoft.StoragePool/diskPools",
            sdg["name"] == "Microsoft.StreamAnalytics/streamingJobs",
            sdg["name"] == "Microsoft.Synapse/workspaces",
            sdg["name"] == "Microsoft.Web/hostingEnvironments",
            sdg["name"] == "Microsoft.Web/serverFarms"
          ]),
          lookup(sdg, "actions", null) == null ? true : anytrue([
            sdg["actions"] == "Microsoft.Network/networkinterfaces/*",
            sdg["actions"] == "Microsoft.Network/virtualNetworks/subnets/action",
            sdg["actions"] == "Microsoft.Network/virtualNetworks/subnets/join/action",
            sdg["actions"] == "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
            sdg["actions"] == "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
          ])
        ])
      ])
    ])
    error_message = "Invalid value. For possible values refer `https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet#name`."
  }
}

variable "enforce_private_link_endpoint_network_policies" {
  description = "Enable or Disable network policies for the private link endpoint on the subnet."
  type        = bool
  default     = null
}

variable "enforce_private_link_service_network_policies" {
  description = "Enable or Disable network policies for the private link service on the subnet."
  type        = bool
  default     = null
}

variable "service_endpoints" {
  description = "The list of Service endpoints to associate with the subnet."
  type        = list(string)
  default     = []
  validation {
    condition = alltrue([
      for service_endpoint in var.service_endpoints : anytrue([
        service_endpoint == "Microsoft.AzureActiveDirectory",
        service_endpoint == "Microsoft.AzureCosmosDB",
        service_endpoint == "Microsoft.ContainerRegistry",
        service_endpoint == "Microsoft.EventHub",
        service_endpoint == "Microsoft.KeyVault",
        service_endpoint == "Microsoft.ServiceBus",
        service_endpoint == "Microsoft.Sql",
        service_endpoint == "Microsoft.Storage",
        service_endpoint == "Microsoft.Web",
      ])
    ])
    error_message = "Possible values include: \"Microsoft.AzureActiveDirectory\", \"Microsoft.AzureCosmosDB\", \"Microsoft.ContainerRegistry\", \"Microsoft.EventHub\", \"Microsoft.KeyVault\", \"Microsoft.ServiceBus\", \"Microsoft.Sql\", \"Microsoft.Storage\" and \"Microsoft.Web\"."
  }
}

variable "service_endpoint_policy_ids" {
  description = "The list of IDs of Service Endpoint Policies to associate with the subnet."
  type        = set(string)
  default     = null
}

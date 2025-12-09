variable "resource_group_name" {
  description = "Resource group name"
  type = string
}

variable "location" {
  description = "Azure location for the VNet"  
  type = string
}

variable "vnet_name" {
  description = "Virtual network name"
  type = string
}

variable "vnet_address_space" {
  description = "Virtual network CIDR range"
  type = list(string)
}

variable "vnet_dns_servers" {
  description = "List of DNS servers for the virtual network"
  type = list(string)
    default = []
}

variable "vnet_subnets" {
  description = "List of virtual network subnets"
  type = list(object({
    name             = string
    address_prefixes = list(string)
    service_endpoints = optional(list(string))
    
  }))
  default = []
}

variable "tags" {
  description = "Tags to apply to resources"
  type = map(string)
  default = {}
}
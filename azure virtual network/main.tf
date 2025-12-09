resource "azurerm_resource_group" "networking" {
  name     = "rg-networking-prod"
  location = "eastus"
}

module "azure_vnet" {
    source               = "./modules/azure_vnet"
    resource_group_name  = azurerm_resource_group.networking.name
    location             = azurerm_resource_group.networking.location
    vnet_name            = var.vnet_name
    vnet_address_space   = var.vnet_address_space
    vnet_dns_servers     = var.vnet_dns_servers
    vnet_subnets         = var.vnet_subnets
    tags                 = var.tags
}
resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  location            = azurerm_resource_group.networking.location
  resource_group_name = azurerm_resource_group.this.name
  address_space       = var.vnet_address_space
  dns_servers = length(var.vnet_dns_servers) > 0 ? var.vnet_dns_servers : null
  
  tags = var.tags
}

resource "azurerm_subnet" "this" {
  for_each             = { for subnet in var.vnet_subnets : subnet.name => subnet }
  name                 = each.key
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = each.value.address_prefixes
  service_endpoints    = lookup(each.value, "service_endpoints", [])
}


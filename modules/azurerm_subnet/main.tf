resource "azurerm_subnet" "subnet"{
  for_each = var.snets
  name = each.value.subnetname
  resource_group_name = each.value.rgname
  virtual_network_name = each.value.virtual_network_name
  address_prefixes = [each.value.address_prefix]
}



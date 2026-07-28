data "azurerm_subnet" "datasubnet" {
  for_each = var.vm
  name                 = each.value.subnetname
  virtual_network_name = each.value.vnetname
  resource_group_name  = each.value.rgname
}


data "azurerm_public_ip" "datapublicip" {
  for_each = var.vm
  name                = each.value.publicipname
  resource_group_name = each.value.rgname
}

data "azurerm_network_interface" "datanic" {
  for_each = var.vm
  name                = each.value.nicname
  resource_group_name = each.value.rgname
}
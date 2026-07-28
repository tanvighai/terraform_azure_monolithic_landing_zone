resource "azurerm_public_ip" "publicip" {
  for_each            = var.publicipdetails
  name                = each.value.publicipname
  resource_group_name = each.value.rgname
  location            = each.value.location
  allocation_method   = "Static"
}











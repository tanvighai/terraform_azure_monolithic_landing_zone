resource "azurerm_network_interface" "nic" {
for_each = var.vm
name                = each.value.nicname
location            = each.value.location
resource_group_name = each.value.rgname

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.datasubnet[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.datapublicip[each.key].id
    private_ip_address_allocation = "Dynamic"
    
  }
}





resource "azurerm_linux_virtual_machine" "virtual_machine" {
depends_on = [azurerm_network_interface.nic]
  for_each                        = var.vm
  name                            = each.value.vmname
  resource_group_name             = each.value.rgname
  location                        = each.value.location
  size                            = each.value.vmsize
  admin_username                  = each.value.adminusername
  admin_password                  = each.value.adminpassword
  disable_password_authentication = true

  network_interface_ids = [data.azurerm_network_interface.datanic[each.key].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}







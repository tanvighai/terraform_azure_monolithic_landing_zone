#resource group
variable "rgs" {}
module "rg" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

#vnet
variable "vnet-details" {}
module "vnet" {
  depends_on   = [module.rg]
  source       = "../../modules/azurerm_vnet"
  vnet-details = var.vnet-details
}

#subnets 
variable "snets" {}
module "subnet" {
  depends_on = [module.rg, module.vnet]
  source     = "../../modules/azurerm_subnet"
  snets      = var.snets
}


variable "publicipdetails" {}

module "pulic_ip" {
  depends_on      = [module.rg, ]
  source          = "../../modules/azurerm_public_ip"
  publicipdetails = var.publicipdetails
}


variable "vm" {}

module "nic" {
  depends_on      = [module.rg, module.subnet, module.pulic_ip]
  source          = "../../modules/azurerm_network_interface"
  vm              = var.vm
  snets           = var.snets
  publicipdetails = var.publicipdetails
  # ssh_public_key = var.ssh_public_key
}

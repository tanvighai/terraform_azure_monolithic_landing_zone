rgs = {
  rg1 = {
    rgname   = "devrg"
    location = "eastus"
  }
}


vnet-details = {
  vnet1 = {
    name          = "vnetpractice1"
    location      = "East US"
    rgname        = "devrg"
    address_space = ["10.0.0.0/16"]
  }
}




snets = {
  frontsubnet = {
    subnetname           = "frontendsubnet"
    address_prefix       = "10.0.1.0/24"
    virtual_network_name = "vnetpractice1"
    rgname               = "devrg"
  }
  backsubnet = {
    subnetname           = "backendsubnet"
    address_prefix       = "10.0.2.0/24"
    virtual_network_name = "vnetpractice1"
    rgname               = "devrg"
  }
}

publicipdetails = {
  bastionpip = {
    publicipname = "bastionpublicip"
    rgname       = "dev-rg"
    location     = "eastus"
  }

  appgwpip = {
    publicipname = "appgwpublicip"
    rgname       = "dev-rg"
    location     = "eastus"
  }
}



vm = {
  vm1 = {
    nicname    = "frontendnic"
    location   = "eastus"
    rgname     = "devrg"
    subnetname = "frontendsubnet"
    # publicipname  = "frontendpublicip"
    vmname        = "frontendvm"
    vmsize        = "Standard_B1s"
    adminusername = "adminuser"
    # adminpassword = "Admin@1234"
    vnetname = "vnetpractice1"
  }

  vm2 = {
    nicname       = "backendnic"
    location      = "eastus"
    rgname        = "devrg"
    subnetname    = "backendsubnet"
    vmname        = "backendvm"
    vmsize        = "Standard_B1s"
    adminusername = "adminuser"
    # adminpassword = "Admin@1234"
    vnetname = "vnetpractice1"
    # publicipname  = "backendpublicip"
  }


}




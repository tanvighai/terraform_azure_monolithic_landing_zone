terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "db01d82e-c301-43db-85a5-0174b78a7d18"
}




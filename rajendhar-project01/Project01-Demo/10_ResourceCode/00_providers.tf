# Do not delete this. It will be standard 
provider "azurerm" {
  version = "~>3.50"
  features {}

}

# To use the state file from backend (Storage account)
terraform {
  backend "azurerm" {}
}
# Code for resouce group creation
resource "azurerm_resource_group" "create-rg" {
    name      = "Webapps01-RG"
    location  = "uksouth"
    
    tags      = local.tags
}

terraform {
  backend "azurerm"{
    resource_group_name = "storage-tfstate-rg"
    storage_account_name = "tfstateeastus001"
    container_name = "bookstorestate"
    key = "terraform.bookstorestate"
    access_key = "7wMkPUfvaKgZOmoDlr1IlXG9TMFixqDFzztFTl/Z62AGxnnzIx1BiXx7NHDQYVE+EdORu755rzIo+AStBDcZpQ=="
  }
}


provider "azurerm" {
    features {
      
    }
    subscription_id = var.subscription_id
    client_id = var.client_id
    tenant_id = var.tenant_id
    client_secret = var.client_secret
  
}

data "azurerm_resource_group" "rg11" {
  name = "bookstorerg"
  
}
data "azurerm_virtual_network" "vnet11" {
  name = "vnetbookstore"
  resource_group_name = data.azurerm_resource_group.rg11.name
  
}
resource "azurerm_subnet" "subnetqa11" {
  name = "subnetqa"
  virtual_network_name = data.azurerm_virtual_network.vnet11.name
  resource_group_name = data.azurerm_resource_group.rg11.name
  address_prefixes = [ "10.0.1.0/24" ]

  
}
output "virtual_network_id" {
  value = data.azurerm_virtual_network.vnet11.id
  
}

output "vnet_address_space" {
  value = data.azurerm_virtual_network.vnet11.address_space
  
}

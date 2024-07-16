terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
   }
  backend "azurerm" {

  }
}



provider "azurerm" {
    features {}

}
resource "azurerm_resource_group" "home-lab-aks" {
  name     = "home-lab-aks"
  location = "east us"
}

resource "azurerm_kubernetes_cluster" "home-lab-aks" {
  name                = "home-lab-aks"
  location            = azurerm_resource_group.home-lab-aks.location
  resource_group_name = azurerm_resource_group.home-lab-aks.name
  dns_prefix          = "home-lab-aksaks1"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_b2s"
  }

  identity {
    type = "SystemAssigned"
  }
}


resource "azurerm_dns_zone" "home-lab-aks-public" {
  name                = "vitorreis.dev.br"
  resource_group_name = azurerm_resource_group.home-lab-aks.name
}

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


# # resource "azurerm_virtual_network" "example" {
# #   name                = "network-home-lab"
# #   location            = azurerm_resource_group.home-lab-aks.location
# #   resource_group_name = azurerm_resource_group.home-lab-aks.name
# #   address_space       = ["10.254.0.0/16"]
# # }

# # resource "azurerm_subnet" "example" {
# #   name                 = "subnet-appgw"
# #   virtual_network_name = azurerm_virtual_network.example.name
# #   resource_group_name = azurerm_resource_group.home-lab-aks.name
# #   address_prefixes     = ["10.254.0.0/24"]
# # }

# # resource "azurerm_public_ip" "example" {
# #   name                = "pip-appgw"
# #   sku                 = "Standard"
# #   location            = azurerm_resource_group.home-lab-aks.location
# #   resource_group_name = azurerm_resource_group.home-lab-aks.name
# #   allocation_method   = "Static"
# # }

# # resource "azurerm_application_gateway" "network" {
# #   name                = "appgateway"
# #   location            = azurerm_resource_group.home-lab-aks.location
# #   resource_group_name = azurerm_resource_group.home-lab-aks.name


# #   sku {
# #     name     = "WAF_v2"
# #     tier     = "WAF_v2"
# #     capacity = 2
# #   }

# #   gateway_ip_configuration {
# #     name      = "my-gateway-ip-configuration"
# #     subnet_id = azurerm_subnet.example.id
# #   }

# #   frontend_port {
# #     name = "frontend_port_name"
# #     port = 80
# #   }

# #   frontend_ip_configuration {
# #     name                 = "frontend_ip_configuration_name"
# #     public_ip_address_id = azurerm_public_ip.example.id
# #   }

# #   backend_address_pool {
# #   name = "backend_address_pool_name"
# #     ip_addresses = ["135.237.50.218"]
# #   }

# #   backend_http_settings {
# #     name                  = "http_setting_name"
# #     cookie_based_affinity = "Disabled"
# #     path                  = ""
# #     port                  = 80
# #     protocol              = "Http"
# #     request_timeout       = 60
# #   }

# #   http_listener {
# #     name                           = "listener_name"
# #     frontend_ip_configuration_name = "frontend_ip_configuration_name"
# #     frontend_port_name             = "frontend_port_name"
# #     protocol                       = "Http"
# #   }

# #   request_routing_rule {
# #     name                       = "request_routing_rule_name"
# #     priority                   = 9
# #     rule_type                  = "Basic"
# #     http_listener_name         = "listener_name"
# #     backend_address_pool_name  = "backend_address_pool_name"
# #     backend_http_settings_name = "http_setting_name"
# #   }

#   waf_configuration  {
#   enabled          = false
#   firewall_mode    = "Prevention"
#   rule_set_version = "3.2"
#   }
# }

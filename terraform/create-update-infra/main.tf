terraform {  
  required_providers {    
    azurerm = {      
      source  = "hashicorp/azurerm"      
      version = "~> 2.65"    
    }  
  }
  
  required_version = ">= 0.14.9"
}

provider "azurerm" {  
  features {}
}

resource "azurerm_resource_group" "k8s" {  
  name     = var.resource_group
  location = var.location
}

resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.cluster_name
  location            = azurerm_resource_group.k8s.location
  resource_group_name = azurerm_resource_group.k8s.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name            = "agentpool"
    node_count      = var.agent_count
    vm_size         = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "Standard"
    network_plugin = "kubenet"
  }

  tags = {
    Environment = "Production"
  }
}
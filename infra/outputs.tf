output "aks_id" {
  value = azurerm_kubernetes_cluster.k8s.id
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.k8s.fqdn
}

output "aks_node_rg" {
  value = azurerm_kubernetes_cluster.k8s.node_resource_group
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.k8s.kube_config.0.client_certificate
}
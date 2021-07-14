variable resource_group {
    default = "azure-k8s-desafio-agility"
}

variable "location" {
  description = "The Azure location where all resources in this example should be created"
  default     = "westeurope"
}

variable "agent_count" {
    default = 2
}

variable "dns_prefix" {
    default = "k8-desafio-agility"
}

variable cluster_name {
    default = "k8-desafio-agility"
}
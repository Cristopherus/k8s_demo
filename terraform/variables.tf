variable "agent_count" {
  default = 1
}

# The following two variable declarations are placeholder references.
# Set the values for these variable in terraform.tfvars
variable "aks_service_principal_app_id" {
}

variable "aks_service_principal_client_secret" {
}

variable "admin_username" {
  default = "rekrutacja-aks"
}

variable "cluster_name" {
  default = "rekrutacja-aks"
}

variable "dns_prefix" {
  default = "rekrutacja-aks"
}

variable "resource_group_location" {
  default     = "West Europe"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  default     = "rekrutacja-aks"
  description = "Resource group name that is unique in your Azure subscription."
}

variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

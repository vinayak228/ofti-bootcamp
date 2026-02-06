output "postgres_fqdn" {
  value = module.postgres.postgres_fqdn
}

output "aks_name" {
  value = module.aks.aks_name
}

output "kubeconfig" {
  value     = module.aks.kube_config
  sensitive = true
}

output "k8s_cluster_name" {
  value = google_container_cluster.gke_cluster.name
  description = "Nome do cluster GKE"
}

output "k8s_cluster_host" {
  value = google_container_cluster.gke_cluster.endpoint
  description = "Host do cluster GKE"
}
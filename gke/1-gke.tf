resource "google_container_cluster" "gke_cluster" {
  name     = "gkecluster"
  location = "us-central1"
  deletion_protection = false

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = var.vpc_name
  subnetwork = var.subnet_name

  ip_allocation_policy {
    cluster_secondary_range_name = "k8s-pod"
    services_secondary_range_name = "k8s-service"
  }
}

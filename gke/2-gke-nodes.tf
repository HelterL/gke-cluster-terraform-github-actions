# Node Pool Gerenciado Separadamente
resource "google_container_node_pool" "nodes_primarios" {
  name       = "gke-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.gke_cluster.name
  node_count = "1"

  management {
    auto_repair = true
    auto_upgrade = true
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      node = "node-gke-cluster"
    }
    preemptible = false
    machine_type = "e2-standard-2"
    tags         = ["gke-node"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
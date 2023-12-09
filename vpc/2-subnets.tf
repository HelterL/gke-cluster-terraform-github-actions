resource "google_compute_subnetwork" "subnat" {
  name = "subnat"
  ip_cidr_range = "10.2.0.0/16"
  network = google_compute_network.vpc.name
  region = "us-central1"
  
  secondary_ip_range {
    range_name = "k8s-pod"
    ip_cidr_range = "10.48.0.0/14"
  }
  secondary_ip_range {
    range_name = "k8s-service"
    ip_cidr_range = "10.52.0.0/20"
  }
}


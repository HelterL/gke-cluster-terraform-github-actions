resource "google_compute_network" "vpc" {
  name = "vpc-gke"
  auto_create_subnetworks = false
  delete_default_routes_on_create = false
  routing_mode = "REGIONAL"
  mtu = 1460
}
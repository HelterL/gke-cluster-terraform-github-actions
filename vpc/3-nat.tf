resource "google_compute_router" "router" {
  name    = "nat-router"
  network = google_compute_network.vpc.id
  region  = "us-central1"
}

resource "google_compute_router_nat" "nat" {
  name                               = "my-router-nat"
  router                             = google_compute_router.router.name
  region                             = "us-central1"
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name = google_compute_subnetwork.subnat.id
    source_ip_ranges_to_nat = [ "ALL_IP_RANGES" ]
  }
  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}

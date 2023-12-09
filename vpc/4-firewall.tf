resource "google_compute_firewall" "enablessh" {
  name = "enable-ssh"
  network = google_compute_network.vpc.name
  
  allow {
    protocol = "tcp"
    ports = [ "22" ]
  }
  source_ranges = [ "0.0.0.0/0" ]
}
resource "google_compute_firewall" "ssh-allow" {
  name      = "ssh-allow"
  network   = google_compute_network.main.name
  direction = "INGRESS"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
}
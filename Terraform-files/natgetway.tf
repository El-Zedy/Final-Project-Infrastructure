resource "google_compute_router" "task_router" {
  name    = var.router_name
  network = google_compute_network.vpc_network.id
}

resource "google_compute_router_nat" "task_nat" {
  name                               = var.nat_name
  router                             = google_compute_router.task_router.name
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
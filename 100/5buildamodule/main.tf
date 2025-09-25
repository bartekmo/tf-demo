resource "google_compute_network" "dep" {
  name                    = "demo-vpc"
  auto_create_subnetworks = false
}


resource "google_compute_subnetwork" "dep" {
  name          = "demo-sb"
  network       = google_compute_network.dep.name
  region        = "europe-west6"
  ip_cidr_range = "10.0.0.0/24"
}

resource "google_compute_address" "dep" {
  name         = "demo-addr"
  region       = "europe-west6"
  subnetwork   = google_compute_subnetwork.dep.id
  address_type = "INTERNAL"
}


data "google_compute_zones" "myzones" {
  region = "europe-west6"
}

output "zones" {
  value = data.google_compute_zones.myzones
}


data "google_client_config" "current" {}

module "networks" {
  for_each = var.nets
  source   = "terraform-google-modules/network/google"
  version  = "~> 12.0"

  project_id   = data.google_client_config.current.project
  network_name = "${each.key}-vpc"

  subnets = [{
    subnet_name   = "${each.key}-sb"
    subnet_ip     = each.value
    subnet_region = data.google_client_config.current.region
  }]
}

module "fgtha" {
  source = "git::github.com/fortinet/terraform-google-fgt-ha-ap-lb"

  prefix = var.prefix
  region = data.google_client_config.current.region
  image = {
    version = "7.6.3"
    license = "PAYG"
  }
  labels = {
    owner : "bmoczulski"
  }
  frontends = ["demo1", "demo2"]
  subnets   = [for key, val in var.nets : one(module.networks.subnets_names)]

  depends_on = [
    module.networks
  ]
}

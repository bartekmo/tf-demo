terraform {
  required_providers {
    fortios = {
      source = "fortinetdev/fortios"
    }
  }
}

provider "fortios" {
  hostname = "192.168.89.1"
  insecure = true
}

data "fortios_router_staticlist" "demo" {}

data "fortios_router_static" "demo" {
  for_each = toset([for num in data.fortios_router_staticlist.demo.seq_numlist : tostring(num)])
  seq_num  = each.value
}

output "routes" {
  value = data.fortios_router_static.demo
}

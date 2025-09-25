terraform {
  required_providers {
    fortiappseccloud = {
      source  = "fortinet/fortiappseccloud"
      version = "1.0.3"
    }
  }
}

provider "fortiappseccloud" {
  hostname  = "api.appsec.fortinet.com"
  api_token = "ZWQ5NjJkNjYtYjA3OC0xMWVhLThkNmUtMGEyZjRiZGUwODU2OjBCMEU4ODhDNUMwRDQ2QkZCRjU4QTE5M0UyRkY1OTk2OmM4ZDA3ZjMzZDEyYzllNGY2NWNkZjg1ODQ4NzBjN2E3"
}

resource "fortiappseccloud_waf_app" "example" {
  app_name    = "demo-app"
  domain_name = "demo.gcp.40net.cloud"
  app_service = {
    http  = 80
    https = 443
  }
  origin_server_ip      = "1.1.1.1"
  origin_server_service = "HTTPS"
  cdn                   = false
  continent_cdn         = false
}

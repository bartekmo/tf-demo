variable "nets" {
  type        = map(string)
  description = "Map of network names to their CIDRs"
  default = {
    "ext"    = "10.0.1.0/24",
    "int"    = "10.0.2.0/24",
    "hamgmt" = "10.0.3.0/24"
  }
}


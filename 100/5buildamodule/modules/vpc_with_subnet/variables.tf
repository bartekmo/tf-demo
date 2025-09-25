variable "region" {
  type        = string
  description = "Region to deploy subnet"
}

variable "ip_cidr_range" {
  type        = string
  description = "IP range of the subnet"
}

variable "prefix" {
  type        = string
  description = "Prepend this prefix to resource names"
  default     = "demo"
}

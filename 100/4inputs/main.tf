/*
terraform {
  cloud {
    organization = "bartekmo"
    workspaces {
      name = "tf-sme-demo"
    }
  }
}
*/

provider "aws" {
  region = var.region
}

data "aws_subnets" "all" {}

locals {
  subnets_ordered = data.aws_subnets.all.ids
}

data "aws_subnet" "all" {
  for_each = toset(data.aws_subnets.all.ids)
  id       = each.value
}

data "aws_subnet" "ordered" {
  count = length(local.subnets_ordered)
  id    = local.subnets_ordered[count.index]
}

output "subnets" {
  value = { for key, val in data.aws_subnet.ordered : key => val.cidr_block }
}

provider "aws" {
  region = "eu-west-1"
}


data "aws_regions" "all" {
  all_regions = true
}

output "regions" {
  value = data.aws_regions.all
}

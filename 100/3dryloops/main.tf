provider "aws" {
  region = "eu-south-1"
}

data "aws_subnets" "all" {}

output "subnets" {
  value = data.aws_subnet.all
}

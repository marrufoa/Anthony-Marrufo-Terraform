terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block                       = "10.0.0.0/16"
  assign_generated_ipv6_cidr_block = true
  enable_dns_hostnames             = true
  enable_dns_support               = true
  tags = {
    "name" = "${var.default_tags.env}-VPC"
  }
}

resource "aws_sub" "public" {
  count                   = 2
  vpc_id                  = aws_vpc.main.vpc_id
  cidr_block              = cidr_block(aws_vpc.main.cidr_block, 8, count.index)
  map_public_ip_on_launch = true
  tags = {
    "Name" = "${var.default_tags.env}-Public-Subnet-${data.aws.availability_zones.availability_zone.name[count.index]}"
  }
  availability_zone = data.aws_availability_zones.availability_zone.Names[count.index]
}

resource "aws_sub" "private" {
  count      = 2
  vpc_id     = aws_vpc.main.vpc_id
  cidr_block = cidr_block(aws_vpc.main.cidr_block, 8, count.index + 2)
  tags = {
    "Name" = "${var.default_tags.env}-Private-Subnet-${data.aws.availability_zones.availability_zone.name[count.index]}"
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

# Create a VPC
resource "aws_vpc" "ntair_vpc" {
  cidr_block = var.vpc-cidr

  tags = {
    Name = "ntair-vpc"
  }
}
#InternetGateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.ntair_vpc.id

  tags = {
    Name = var.Ig-name
  }
}
#Create the Public Route Table
resource "aws_route_table" "Publicrt" {
  vpc_id = aws_vpc.ntair_vpc.id
  tags = {
    Name = "publicrt"
  }
}
#Create the Private Route Table
resource "aws_route_table" "PrivateRt" {
  vpc_id = aws_vpc.ntair_vpc.id
tags = {
    Name = "PrivateRt"
  }
}
# Create Subnets
resource "aws_subnet" "Subnets" {
  count                = length(var.subnet-cidr)
  cidr_block           = var.subnet-cidr[count.index]
  availability_zone    = "${var.region}${var.subnet-az[count.index]}"
  vpc_id               = aws_vpc.ntair_vpc.id

  tags = {
    Name               = var.subnet-names[count.index]
  }

  depends_on = [
    aws_vpc.ntair_vpc 
  ]
}
#Security Group for Instance
resource "aws_security_group" "SecurityFirewall" {
  name        = "Firewall for Instances"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.ntair_vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = [var.vpc-cidr]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "SecurityFirewall"
  }
}
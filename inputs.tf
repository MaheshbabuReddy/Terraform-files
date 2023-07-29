variable "region" {
  type = string
  default = "us-west-1"
  description = "Region for Infrastructure"
  }
variable "vpc-cidr" {
  type = string
  default = "10.0.0.0/16"
  description = "VPC cidr range"
}
variable "Ig-name" {
  type = string
  default = "Igway"
}
variable "subnet-cidr" {
  type = list(string)
  default = ["10.0.0.0/24","10.0.1.0/24","10.0.2.0/24"]
  description = "cidr range for Subnets"
}
variable "subnet-az" {
type = list(string)
default = ["a","b","a"]
description = "AvailableZones for Subnets"
}
variable "subnet-names" {
type = list(string)
default = ["web1","app1","db1"]
description = "Names of the Subnets"
}
variable "image-id" {
  type = string
  
  description = "Amazon Image"
}
variable "key-name" {
type = string
default = "my_id_rsa"
}
variable "instance_type" {
  type = string
  default = "t2.micro"
}

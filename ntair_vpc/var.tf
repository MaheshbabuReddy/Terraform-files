variable "region" {
  type = string
}

variable "vpc_cidr" {
    type = string
}

variable "private_subnets" {
  type = list(string)
}
variable "pubic_subnets" {
  type = list(string)
}
variable "subnet_ids" {
  type =list(string)
  
}
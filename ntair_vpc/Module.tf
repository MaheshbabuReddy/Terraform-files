module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "ntair-vpc"
  cidr = var.vpc_cidr

  azs             = [format("%sa",var.region), format("%sb",var.region)]
  private_subnets = var.private_subnets
  public_subnets  = var.pubic_subnets

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
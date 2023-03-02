region = "us-west-2"
vpc_cidr = "192.168.0.0/16"
private_subnets = [ "192.168.0.0/24","192.168.1.0/24","192.168.2.0/24" ]
pubic_subnets = [ "192.168.3.0/24","192.168.4.0/24","192.168.5.0/24" ]
subnet_ids = [ "module.vpc.public_subnets[0].id","module.vpc.public_subnets[1].id","module.vpc.public_subnets[2].id" ]          

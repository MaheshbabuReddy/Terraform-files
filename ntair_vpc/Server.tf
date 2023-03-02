resource "aws_instance" "webinfrastructure" {
  ami           = local.ami_id
  associate_public_ip_address = true
  instance_type = local.instance-type
  key_name      = local.key_pair
  subnet_id = module.vpc.public_subnets[0]
  security_groups =[aws_security_group.web-sg.id]

  tags = {
    Name = "nginx server"
  }
  depends_on =[
  module.vpc ,
  aws_security_group.web-sg
  
]
}

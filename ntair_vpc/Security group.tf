resource "aws_security_group" "web-sg" {
  name        = "web-sg"
  description = "Allow TCP  Traffic"
  

  ingress {
    description      = "Security group for apachee server"
    from_port        = local.from_port
    to_port          = local.to_port
    protocol         = local.protocol   
    cidr_blocks      =[local.anywhere ]   
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ALL TCP"
  }
  vpc_id = module.vpc.vpc_id
depends_on =[
  module.vpc
]
  
}

locals {
  
  from_port       = 0
  to_port         = 65535
  anywhere        = "0.0.0.0/0"
  protocol        = "TCP"
  ami_id          = "ami-0ecc74eca1d66d8a6"
  key_pair        =  "my_id_rsa"
  instance-type  = "t2.micro" 
 
}

resource "aws_instance" "Server" {
  ami           = var.image-id  
  instance_type = var.instance_type  
  key_name      = var.key-name
  count = 3
  subnet_id = aws_subnet.Subnets[count.index].id
  vpc_security_group_ids = [aws_security_group.SecurityFirewall.id]

  tags = {
    Name = "Instances"
  }
  depends_on = [ 
    aws_security_group.SecurityFirewall
   ]
}

  








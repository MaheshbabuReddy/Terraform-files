terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}




provider "aws" {
  region = "us-west-2"  # Change this to your desired region
}
    
resource "aws_instance" "example" {
  ami           = "ami-0ecc74eca1d66d8a6"  # Amazon Linux 2 AMI ID (Update to your desired AMI)
  instance_type = "t2.micro"               # Change to your desired instance type
  key_name      = "my_id_rsa"     # Replace with the name of your key pair

  tags = {
    Name = "MyEC2Instance"
  }
  

  connection {
    type        = "ssh"
    user        = "ubuntu"  # For Amazon Linux instances, the default user is ec2-user
    private_key = file("~/.ssh/id_rsa")  # Replace with the path to your private key
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y git",
    ]
  }
}




 


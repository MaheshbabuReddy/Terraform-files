region = "us-west-2"
vpc-cidr = "192.168.0.0/16"
Ig-name = "Igw"
subnet-cidr = ["192.168.0.0/24","192.168.1.0/24","192.168.2.0/24"]
subnet-az = [ "a","b","a" ]
subnet-names = [ "web","app","db" ] 
image-id = "ami-03f65b8614a860c29"
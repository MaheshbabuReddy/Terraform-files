resource "aws_vpc" "ntiervpc" {
    cidr_block = var.vpc_range
    tags = {
      "Name" = "ntier"
    }
}


resource "aws_subnet" "subnets" {
    count = length(var.subnet_cidrs)
    cidr_block = var.subnet_cidrs[count.index]
    vpc_id = aws_vpc.ntiervpc.id   
    
     tags = {
      "Name" = var.subnet_name_tags[count.index]
    }
}
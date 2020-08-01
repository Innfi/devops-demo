resource "aws_subnet" "DemoSubnetPrivateA" {
    cidr_block = "10.0.3.0/24" 
    vpc_id = aws_vpc.DemoVPC.id 
    availability_zone = "ap-northeast-2a"

    tags = {
        Name = "Demo Subnet PrivateA"
    }
}

resource "aws_subnet" "DemoSubnetPrivateC" {
    cidr_block = "10.0.4.0/24" 
    vpc_id = aws_vpc.DemoVPC.id 
    availability_zone = "ap-northeast-2c"

    tags = {
        Name = "Demo Subnet PrivateC"
    }
}

resource "aws_subnet" "DemoSubnetPrivateDBA" {
    cidr_block = "10.0.5.0/24" 
    vpc_id = aws_vpc.DemoVPC.id 
    availability_zone = "ap-northeast-2a"

    tags = {
        Name = "Demo Subnet PrivateDBA"
    }
}

resource "aws_subnet" "DemoSubnetPrivateDBC" {
    cidr_block = "10.0.6.0/24" 
    vpc_id = aws_vpc.DemoVPC.id 
    availability_zone = "ap-northeast-2c"

    tags = {
        Name = "Demo Subnet PrivateDBC"
    }
}
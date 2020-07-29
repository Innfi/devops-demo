resource "aws_subnet" "DemoSubnetPublic-A" {
    cidr_block = "10.10.0.0/24" 
    vpc_id = aws_vpc.DemoVPC.id 
    availability_zone = "ap-northeast-2a"
    map_public_ip_on_launch = true
    tags = {
        Name="Demo subnet public a"
    }
}

resource "aws_subnet" "DemoSubnetPublic-B" {
    cidr_block = "10.10.5.0/24" 
    vpc_id = aws_vpc.DemoVPC.id 
    availability_zone = "ap-northeast-2b"
    map_public_ip_on_launch = true
    tags = {
        Name="Demo subnet public b"
    }
}

resource "aws_subnet" "DemoSubnetPrivateWAS-A" {
    cidr_block = "10.10.10.0/24"
    vpc_id = aws_vpc.DemoVPC.id
    availability_zone = "ap-northeast-2a"
    tags = {
        Name="Demo subnet private for WAS a"
    }
}

resource "aws_subnet" "DemoSubnetPrivateWAS-B" {
    cidr_block = "10.10.15.0/24"
    vpc_id = aws_vpc.DemoVPC.id
    availability_zone = "ap-northeast-2b"
    tags = {
        Name="Demo subnet private for WAS b"
    }
}

#resource "aws_subnet" "DemoSubnetPrivateDB-A" {
#    cidr_block = "10.10.20.0/24"
#    vpc_id = aws_vpc.DemoVPC.id
#    availability_zone = "ap-northeast-2a"
#    tags = {
#        Name="Demo subnet private for WAS a"
#    }
#}
#
#resource "aws_subnet" "DemoSubnetPrivateDB-B" {
#    cidr_block = "10.10.25.0/24"
#    vpc_id = aws_vpc.DemoVPC.id
#    availability_zone = "ap-northeast-2b"
#    tags = {
#        Name="Demo subnet private for WAS b"
#    }
#}
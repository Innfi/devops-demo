resource "aws_subnet" "DemoSubnetPublic" {
    cidr_block = "10.10.10.0/24" 
    vpc_id = aws_vpc.DemoVPC.id 
    availability_zone = "ap-northeast-2a"
    tags = {
        Name="Demo subnet public"
    }
}

resource "aws_subnet" "DemoSubnetPrivateWAS" {
    cidr_block = "10.10.20.0/24"
    vpc_id = aws_vpc.Demo.id
    availability_zone = "ap-northeast-2b"
    tags = {
        Name="Demo subnet private for WAS"
    }
}

resource "aws_subnet" "DemoSubnetPrivateDB" {
    cidr_block = "10.10.30.0/24"
    vpc_id = aws_vpc.Demo.id
    availability_zone = "ap-northeast-2c"
    tags = {
        Name="Demo subnet private for WAS"
    }
}
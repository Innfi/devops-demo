resource "aws_subnet" "DemoSubnetBastion" {
    cidr_block = "10.10.100.0/24" 
    vpc_id = aws_vpc.DemoVPC.id 
    availability_zone = "ap-northeast-2a"

    map_public_ip_on_launch = true
    tags = {
        Name = "Demo subnet for bastion instances"
    }
}

resource "aws_subnet" "DemoSubnetPublicA" {
    cidr_block = "10.10.0.0/24" 
    vpc_id = aws_vpc.DemoVPC.id 
    availability_zone = "ap-northeast-2a"

    tags = {
        Name = "Demo subnet public a"
    }
}

resource "aws_subnet" "DemoSubnetPublicB" {
    cidr_block = "10.10.5.0/24" 
    vpc_id = aws_vpc.DemoVPC.id 
    availability_zone = "ap-northeast-2b"

    tags = {
        Name = "Demo subnet public b"
    }
}

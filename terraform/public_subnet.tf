resource "aws_subnet" "DemoSubnetPublicA" {
    cidr_block = "10.0.1.0/24" 
    vpc_id = aws_vpc.DemoVPC.id 
    availability_zone = "ap-northeast-2a"
    map_public_ip_on_launch = true

    tags = {
        Name = "Demo Subnet PublicA"
    }
}

resource "aws_subnet" "DemoSubnetPublicC" {
    cidr_block = "10.0.2.0/24" 
    vpc_id = aws_vpc.DemoVPC.id 
    availability_zone = "ap-northeast-2c"
    map_public_ip_on_launch = true

    tags = {
        Name = "Demo Subnet PublicC"
    }
}
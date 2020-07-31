resource "aws_subnet" "DemoSubnetWebA" {
    cidr_block = "10.10.10.0/24" 
    vpc_id = aws_vpc.DemoVPC.id 
    availability_zone = "ap-northeast-2a"

    tags = {
        Name = "Demo subnet private for web a"
    }
}

#resource "aws_subnet" "DemoSubnetWebB" {
#    cidr_block = "10.10.10.0/24" 
#    vpc_id = aws_vpc.DemoVPC.id 
#    availability_zone = "ap-northeast-2b"
#
#    tags = {
#        Name = "Demo subnet private b for web"
#    }
#}

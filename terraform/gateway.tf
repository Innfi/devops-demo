resource "aws_internet_gateway" "DemoGateway" {
    vpc_id = aws_vpc.DemoVPC.id
    tags = {
        Name="DemoGateway"
    }
}
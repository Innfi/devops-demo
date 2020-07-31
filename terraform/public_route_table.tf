resource "aws_route_table" "DemoRouteTablePublicA" {
    vpc_id = aws_vpc.DemoVPC.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.DemoGateway.id
    }

    tags = {
        Name = "Demo route table for public a"
    }
}

resource "aws_route_table_association" "DemoRouteAscPublicA" {
    subnet_id = aws_subnet.DemoSubnetPublicA.id
    route_table_id = aws_route_table.DemoRouteTablePublicA.id
}

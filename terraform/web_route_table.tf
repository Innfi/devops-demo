resource "aws_route_table" "DemoRouteTableWebA" {
    vpc_id = aws_vpc.DemoVPC.id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.DemoNATGatewayA.id
    }

    tags = {
        Name = "Demo route table for web a"
    }
}

resource "aws_route_table_association" "DemoRouteAscWebA" {
    subnet_id = aws_subnet.DemoSubnetWebA.id
    route_table_id = aws_route_table.DemoRouteTableWebA.id
}

resource "aws_route_table" "DemoRouteTablePublic" {
    vpc_id = aws_vpc.DemoVPC.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.DemoGateway.id
    }

    tags = {
        Name = "Demo Route Table Public"
    }
}

resource "aws_route_table_association" "DemoRouteAscPublicA" {
    subnet_id = aws_subnet.DemoSubnetPublicA.id
    route_table_id = aws_route_table.DemoRouteTablePublic.id
}

resource "aws_route_table_association" "DemoRouteAscPublicC" {
    subnet_id = aws_subnet.DemoSubnetPublicC.id
    route_table_id = aws_route_table.DemoRouteTablePublic.id
}
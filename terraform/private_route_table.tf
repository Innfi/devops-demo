resource "aws_route_table" "DemoRouteTablePrivate" {
    vpc_id = aws_vpc.DemoVPC.id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.DemoNATGatewayC.id
    }

    tags = {
        Name = "Demo Route Table Private"
    }
}

resource "aws_route_table_association" "DemoRouteAscPrivateA" {
    subnet_id = aws_subnet.DemoSubnetPrivateA.id
    route_table_id = aws_route_table.DemoRouteTablePrivate.id
}

resource "aws_route_table_association" "DemoRouteAscPrivateC" {
    subnet_id = aws_subnet.DemoSubnetPrivateC.id
    route_table_id = aws_route_table.DemoRouteTablePrivate.id
}

resource "aws_route_table_association" "DemoRouteAscPrivateDBA" {
    subnet_id = aws_subnet.DemoSubnetPrivateDBA.id
    route_table_id = aws_route_table.DemoRouteTablePrivate.id
}

resource "aws_route_table_association" "DemoRouteAscPrivateDBC" {
    subnet_id = aws_subnet.DemoSubnetPrivateDBC.id
    route_table_id = aws_route_table.DemoRouteTablePrivate.id
}

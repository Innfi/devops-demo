resource "aws_route_table" "DemoRouteTableBastion" {
    vpc_id = aws_vpc.DemoVPC.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.DemoGateway.id
    }

    tags = {
        Name = "Demo route table for bastion subnet"
    }
}

resource "aws_route_table_association" "DemoRouteAscBastion" {
    subnet_id = aws_subnet.DemoSubnetBastion.id
    route_table_id = aws_route_table.DemoRouteTableBastion.id
}

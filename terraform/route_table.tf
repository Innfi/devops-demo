resource "aws_default_route_table" "DemoRouteTableDefault" {
    default_route_table_id = aws_vpc.DemoVPC.default_route_table_id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.DemoGateway.id
    }
    tags = {
        Name="DemoRouteTable"
    }
}

resource "aws_route_table" "DemoRouteTableNAT" {
    vpc_id = aws_vpc.DemoVPC.id

    route {
        cidr_block = "0.0.0.0/0" 
        nat_gateway_id = aws_nat_gateway.DemoNATGateway.id
    }
    tags = {
        Name = "DemoRouteTableNAT"
    }
}

resource "aws_route_table_association" "DemoRouteAssociation" {
    subnet_id = aws_subnet.DemoSubnetPrivateWAS-A.id
    route_table_id = aws_route_table.DemoRouteTableNAT.id
}
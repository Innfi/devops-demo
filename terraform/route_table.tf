resource "aws_route_table" "DemoRouteTable" {
    vpc_id = aws_vpc.DemoVPC.id 
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.DemoGateway.id
    }
}

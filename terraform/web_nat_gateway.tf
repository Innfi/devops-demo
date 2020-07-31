resource "aws_eip" "DemoEIP" {
    vpc = true 

    tags = {
        Name = "Demo EIP (for nat gateway)"
    }
}

resource "aws_nat_gateway" "DemoNATGatewayA" {
    allocation_id = aws_eip.DemoEIP.id
    subnet_id = aws_subnet.DemoSubnetPublicA.id

    tags = {
        Name = "Demo nat gateway public a"
    }
}
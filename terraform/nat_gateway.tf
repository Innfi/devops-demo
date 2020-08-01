#resource "aws_eip" "DemoEIPA" {
#    vpc = true 
#
#    tags = {
#        Name = "Demo EIP (for nat gateway a)"
#    }
#}

resource "aws_eip" "DemoEIPC" {
    vpc = true 

    tags = {
        Name = "Demo EIP for NATGatewayC"
    }
}

#resource "aws_nat_gateway" "DemoNATGatewayA" {
#    allocation_id = aws_eip.DemoEIPA.id
#    subnet_id = aws_subnet.DemoSubnetPublicA.id
#
#    tags = {
#        Name = "Demo NAT Gateway PublicA"
#    }
#}

resource "aws_nat_gateway" "DemoNATGatewayC" {
    allocation_id = aws_eip.DemoEIPC.id
    subnet_id = aws_subnet.DemoSubnetPublicC.id

    tags = {
        Name = "Demo NAT Gateway PublicC"
    }
}

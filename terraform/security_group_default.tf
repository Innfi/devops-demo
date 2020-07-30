resource "aws_default_security_group" "DemoSGDefault" {
    vpc_id = aws_vpc.DemoVPC.id 

    ingress {
        description = "http"
        from_port = 80
        to_port = 80
        protocol = "http"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name="DemoSecurityGroup Default"
    }
}

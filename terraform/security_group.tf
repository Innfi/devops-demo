resource "aws_default_security_group" "DemoSGDefault" {
    vpc_id = aws_vpc.DemoVPC.id 

    ingress {
        description = "ssh"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["124.5.226.230/32"]
    }

    #ingress {
    #    description = "http"
    #    from_port = 3000
    #    to_port = 3000
    #    protocol = "http"
    #    cidr_blocks = ["0.0.0.0/0"]
    #}

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name="DemoSecurityGroup"
    }
}

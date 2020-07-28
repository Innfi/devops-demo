resource "aws_security_group" "DemoSG" {
    name = "DemoSecurityGroup"
    vpc_id = aws_vpc.DemoVPC.id 

    ingress {
        description = "http"
        from_port = 80
        to_port = 80
        protocol = "http"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "http"
        from_port = 3000
        to_port = 3000
        protocol = "http"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

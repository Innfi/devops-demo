resource "aws_security_group" "DemoSecurityGroupPrivate" {
    name = "DemoSGPrivate"
    vpc_id = aws_vpc.DemoVPC.id

    ingress {
        description = "http"
        from_port = 3000
        to_port = 3000
        protocol = "tcp" 

        security_groups = [
            aws_security_group.DemoSecurityGroupPublic.id
        ]
    }

    ingress {
        description = "ssh"
        from_port = 22
        to_port = 22
        protocol = "tcp"

        security_groups = [
            aws_security_group.DemoSecurityGroupBastion.id
        ]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "Demo Security Group for Private Subnet"
    }
}



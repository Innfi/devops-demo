resource "aws_security_group" "DemoSecurityGroupBastion" {
    name = "DemoSGBastion"

    ingress {
        description = "ssh"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["124.5.226.230/32"]
    }
    
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "Demo security group for bastion hosts"
    }
}




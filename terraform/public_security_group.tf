resource "aws_security_group" "DemoSecurityGroupALB" {
    name = "DemoSBALB"

    vpc_id = aws_vpc.DemoVPC.id

    ingress {
        description = "http"
        from_port = 80
        to_port = 80
        protocol = "tcp" 
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "Demo Security Group for ALB"
    }
}


resource "aws_security_group" "DemoSecurityGroupPublic" {
    name = "DemoSGWeb"
    vpc_id = aws_vpc.DemoVPC.id

    ingress {
        description = "http"
        from_port = 80
        to_port = 80
        protocol = "tcp" 

        security_groups = [
            aws_security_group.DemoSecurityGroupALB.id
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
        Name = "Demo Security Group for Web Instances"
    }
}


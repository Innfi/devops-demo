resource "aws_instance" "DemoEC2WebA" {
    ami = "ami-0bea7fd38fabe821a"
    instance_type = "t2.micro" 
    key_name = var.key_pair

    subnet_id = aws_subnet.DemoSubnetWebA.id

    vpc_security_group_ids = [
        aws_security_group.DemoSecurityGroupWeb.id
    ]

    tags = {
        Name = "Demo web instance a"
    }
}



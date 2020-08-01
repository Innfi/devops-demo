resource "aws_instance" "DemoEC2WebA" {
    ami = "ami-0bea7fd38fabe821a"
    instance_type = "t2.micro" 
    key_name = var.key_pair

    subnet_id = aws_subnet.DemoSubnetPublicA.id

    vpc_security_group_ids = [
        aws_security_group.DemoSecurityGroupPublic.id
    ]

    tags = {
        Name = "Demo WebInstanceA"
    }
}

resource "aws_instance" "DemoEC2WebC" {
    ami = "ami-0bea7fd38fabe821a"
    instance_type = "t2.micro" 
    key_name = var.key_pair

    subnet_id = aws_subnet.DemoSubnetPublicC.id

    vpc_security_group_ids = [
        aws_security_group.DemoSecurityGroupPublic.id
    ]

    tags = {
        Name = "Demo WebInstanceC"
    }
}



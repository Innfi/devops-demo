resource "aws_instance" "DemoEC2Bastion" {
    ami = "ami-0bea7fd38fabe821a"
    instance_type = "t2.micro" 
    key_name = var.key_pair

    subnet_id = aws_subnet.DemoSubnetPublicA.id
    associate_public_ip_address = true
    vpc_security_group_ids = [
        aws_security_group.DemoSecurityGroupBastion.id
    ]

    tags = {
        Name = "Demo EC2 Bastion Instance"
    }
}

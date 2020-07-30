variable "key_pair" {
    default = "InnfisKey"
}

resource "aws_instance" "DemoEC2PublicA" {
    ami = "ami-0bea7fd38fabe821a"
    instance_type = "t2.micro" 
    key_name = var.key_pair

    subnet_id = aws_subnet.DemoSubnetPublic-A.id
    associate_public_ip_address = true

    tags = {
        Name = "Demo ec2 public - a"
    }
}

resource "aws_instance" "DemoEC2PrivateA" {
    ami = "ami-0bea7fd38fabe821a"
    instance_type = "t2.micro" 
    key_name = var.key_pair

    subnet_id = aws_subnet.DemoSubnetPrivateWAS-A.id

    tags = {
        Name = "Demo ec2 private (WAS) - a"
    }
}
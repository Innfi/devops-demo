resource "aws_vpc" "DemoVPC" {
    cidr_block = "10.10.0.0/16"
    instance_tenancy = "dedicated" 
    tags = {
        Name = "demo_vpc"
    }
}

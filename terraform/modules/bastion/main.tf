# bastion security group
resource "aws_security_group" "bastion" {
    name = "SecurityGroupBastion"
    vpc_id = var.vpc_id

    ingress {
        description = "ssh"
        from_port = var.bastion_ssh_port
        to_port = var.bastion_ssh_port
        protocol = "tcp"
        cidr_blocks = var.bastion_cidr_blocks
    }
    
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = merge(
        {
            "Name" = "Bastion"
        },
        var.tags, 
        var.vpc_tags,
    )
}

# add bastion sg to vpc sgs
resource "aws_security_group_rule" "bastion_ingress" {
    security_group_id = var.vpc_sg_id_public 

    type = "ingress"
    from_port = var.bastion_ssh_port
    to_port = var.bastion_ssh_port
    protocol = "tcp"
    source_security_group_id = aws_security_group.bastion.id
}

# bastion ec2 instance
resource "aws_instance" "bastion" {
    ami = var.bastion_ami_id
    instance_type = var.bastion_type
    key_name = var.bastion_key_pair

    subnet_id = var.bastion_subnet_id
    associate_public_ip_address = true

    vpc_security_group_ids = [
        aws_security_group.bastion.id
    ]

    tags = merge(
        {
            "Name" = "Bastion"
        },
        var.tags, 
        var.vpc_tags,
    )
}


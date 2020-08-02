# locals
locals {
    vpc_id = aws_vpc.this.id
}

# vpc
resource "aws_vpc" "this" {
    cidr_block = var.cidr
    instance_tenancy = "default" 
    enable_dns_hostnames = true

    tags = merge(
        {
            "Name" = format("%s", var.name)
        },
        var.tags, 
        var.vpc_tags,
    )
}

# internet gateway
resource "aws_internet_gateway" "gateway" {
    vpc_id = local.vpc_id

    tags = merge(
        {
            "Name" = format("%s", var.name)
        },
        var.tags, 
        var.vpc_tags,
    )
}

# subnet
resource "aws_subnet" "public" {
    count = length(var.subnet_public)

    vpc_id = local.vpc_id
    availability_zone = var.azs[count.index]
    cidr_block = var.subnet_public[count.index]

    map_public_ip_on_launch = true

    tags = merge(
        {
            "Name" = format("%s-public-%s", var.name, var.azs[count.index])
        },
        var.tags, 
        var.vpc_tags,
    )
}

resource "aws_subnet" "private" {
    count = length(var.subnet_private)

    vpc_id = local.vpc_id
    availability_zone = var.azs[count.index]
    cidr_block = var.subnet_private[count.index]

    tags = merge(
        {
            "Name" = format("%s-private-%s", var.name, var.azs[count.index])
        },
        var.tags, 
        var.vpc_tags,
    )
}

resource "aws_subnet" "private_db" {
    count = length(var.subnet_private_db)

    vpc_id = local.vpc_id
    availability_zone = var.azs[count.index]
    cidr_block = var.subnet_private_db[count.index]

    tags = merge(
        {
            "Name" = format("%s-private-db-%s", var.name, var.azs[count.index])
        },
        var.tags, 
        var.vpc_tags,
    )
}

# EIP for NAT gateway
resource "aws_eip" "nat_eip" {
    count = length(var.azs)

    vpc = true
}

# NAT gateway
resource "aws_nat_gateway" "this" {
    count = length(var.azs)

    allocation_id = aws_eip.nat_eip.*.id[count.index]
    subnet_id = aws_subnet.public.*.id[count.index]

    tags = merge(
        {
            "Name" = format("%s-%s", var.name, var.azs[count.index])
        },
        var.tags, 
        var.vpc_tags,
    )
}

# routing table
resource "aws_route_table" "public" {
    count = length(var.azs) 

    vpc_id = local.vpc_id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gateway.id
    }

    tags = merge(
        {
            "Name" = format("%s-public-%s", var.name, var.azs[count.index])
        },
        var.tags, 
        var.vpc_tags,
    )
}

resource "aws_route_table" "private" {
    count = length(var.azs)

    vpc_id = local.vpc_id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.this.*.id[count.index]
    }

    tags = merge(
        {
            "Name" = format("%s-private-%s", var.name, var.azs[count.index])
        },
        var.tags, 
        var.vpc_tags,
    )
}

# route table association

resource "aws_route_table_association" "public" {
    count = length(var.azs)

    subnet_id = aws_subnet.public.*.id[count.index]
    route_table_id = aws_route_table.public.*.id[count.index]
}

resource "aws_route_table_association" "private" {
    count = length(var.azs)

    subnet_id = aws_subnet.private.*.id[count.index]
    route_table_id = aws_route_table.private.*.id[count.index]
}

resource "aws_route_table_association" "private_db" {
    count = length(var.azs)

    subnet_id = aws_subnet.private_db.*.id[count.index]
    route_table_id = aws_route_table.private.*.id[count.index]
}

# security group
resource "aws_security_group" "alb" {
    vpc_id = local.vpc_id   

    ingress {
        description = "http"
        from_port = var.port_http
        to_port = var.port_http
        protocol = "tcp" 
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = merge(
        {
            "Name" = format("%s-ALB", var.name)
        },
        var.tags, 
        var.vpc_tags,
    )
}

resource "aws_security_group" "public" {
    vpc_id = local.vpc_id

    ingress {
        description = "http"
        from_port = var.port_http
        to_port = var.port_http
        protocol = "tcp" 

        security_groups = [
            aws_security_group.alb.id
        ]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = merge(
        {
            "Name" = format("%s-public", var.name)
        },
        var.tags, 
        var.vpc_tags,
    )
}

resource "aws_security_group" "private" {
    vpc_id = local.vpc_id

    ingress {
        description = "http"
        from_port = var.port_was
        to_port = var.port_was
        protocol = "tcp" 

        security_groups = [
            aws_security_group.public.id
        ]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = merge(
        {
            "Name" = format("%s-private", var.name)
        },
        var.tags, 
        var.vpc_tags,
    )
}

# EC2
resource "aws_instance" "web" {
    count = length(var.azs)

    ami = var.ec2_ami_web
    instance_type = var.ec2_type_web
    key_name = var.key_pair

    subnet_id = aws_subnet.public.*.id[count.index]
    vpc_security_group_ids = [
        aws_security_group.public.id
    ]

    tags = merge(
        {
            "Name" = format("%s-web-%s", var.name, var.azs[count.index])
        },
        var.tags, 
        var.vpc_tags,
    )
}

# ALB target group
resource "aws_lb_target_group" "this" {
    name = format("%s-Targetgroup", var.name)
    port = var.port_http
    protocol = "HTTP"
    vpc_id = local.vpc_id
}

resource "aws_lb_target_group_attachment" "public" {
    count = length(aws_instance.web)

    target_group_arn = aws_lb_target_group.this.arn
    target_id = aws_instance.web.*.id[count.index]
    port = var.port_http
}

# ALB
resource "aws_lb" "web" {
    name = format("%s-ALB-web", var.name)
    internal = false
    load_balancer_type = "application"

    security_groups = [
        aws_security_group.alb.id
    ]
    subnets = aws_subnet.public.*.id

    tags = merge(
        {
            "Name" = format("%s-web", var.name)
        },
        var.tags, 
        var.vpc_tags,
    )
}

resource "aws_lb_listener" "web" {
    load_balancer_arn = aws_lb.web.arn
    port = var.port_http
    protocol = "HTTP"

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.this.arn
    }
}

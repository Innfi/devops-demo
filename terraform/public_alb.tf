resource "aws_lb" "DemoALBPublic" {
    name = "DemoALBPublic"
    internal = false
    load_balancer_type = "application"
    security_groups = [
        aws_security_group.DemoSecurityGroupALB.id
    ]
    subnets = [
        aws_subnet.DemoSubnetPublicA.id, 
        aws_subnet.DemoSubnetPublicC.id
    ]

    tags = {
        Name="Demo ALB Public"
    }
}

resource "aws_lb_listener" "DemoALBPublicListener" {
    load_balancer_arn = aws_lb.DemoALBPublic.arn
    port = "80"
    protocol = "HTTP"

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.DemoALBTG.arn
    }
}
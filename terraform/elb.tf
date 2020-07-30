resource "aws_lb" "DemoLoadBalancer" {
    name = "demo-lb"
    internal = false
    load_balancer_type = "application"

    subnets = [
        aws_subnet.DemoSubnetPublic-A.id,
        aws_subnet.DemoSubnetPublic-B.id
    ]

    tags = {
        Name = "Demo LoadBalancer"
    }
}
resource "aws_lb_target_group" "DemoALBTG" {
    name = "DemoALBTargetGroupPublic"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.DemoVPC.id
}

resource "aws_lb_target_group_attachment" "DemoALBTGAttachmentPublicA" {
    target_group_arn = aws_lb_target_group.DemoALBTG.arn
    target_id = aws_instance.DemoEC2WebA.id 
    port = 80
}

resource "aws_lb_target_group_attachment" "DemoALBTGAttachmentPublicC" {
    target_group_arn = aws_lb_target_group.DemoALBTG.arn
    target_id = aws_instance.DemoEC2WebC.id 
    port = 80
}

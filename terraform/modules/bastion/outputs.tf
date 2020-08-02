# Output variable definitions 

output "bastion_public_dns" {
    description = "public dns addr of bastion instance"
    value = aws_instance.bastion.public_dns
}
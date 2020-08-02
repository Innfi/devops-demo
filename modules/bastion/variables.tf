# Input variable definitions

variable "vpc_id" {
    description = "target vpc id"
    type = string 
}

variable "bastion_cidr_blocks" {
    description = "cidr blocks for bastion instances"
    type = list
}

variable "bastion_ssh_port" {
    description = "port number for bastion instances"
    type = number
    default = 22
}

variable "bastion_ami_id" {
    description = "ami id for bastion instances"
    type = string
    default = "ami-0bea7fd38fabe821a"
}

variable "bastion_type" {
    description = "bastion instance type"
    type = string
    default = "t2.micro"
}

variable "bastion_key_pair" {
    description = "key pair for bastion instances"
    type = string
}

variable "bastion_subnet_id" {
    description = "subnet id for bastion instances"
    type = string
}

variable "vpc_sg_id_public" {
    description = "vpc security id for public subnets "
    type = string
}

variable "vpc_sg_id_private" {
    description = "vpc security id for private subnets "
    type = string
}

variable "vpc_tags" {
    description = "vpc additional tags"
    type = map(string)
    default = {}
}

variable "tags" {
    description = "tags"
    type = map(string)
    default = {}
}

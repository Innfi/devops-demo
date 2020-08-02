# Input variable definitions 

variable "vpc_name" {
    description = "Name of VPC"
    type = string 
    default = "DemoVPC"
}

variable "vpc_cidr" {
    description = "VPC CIDR blocks"
    type = string 
    default = "10.0.0.0/16"
}

variable "vpc_azs" {
    description = "AZs"
    type = list 
    default =  [
        "ap-northeast-2a",
        "ap-northeast-2c"
    ]
}

variable "vpc_public_subnets" {
    description = "Public Subnets"
    type = list(string) 
    default = [
        "10.0.1.0/24",
        "10.0.2.0/24"
    ]
}

variable "vpc_private_subnets" {
    description = "Private Subnets"
    type = list(string) 
    default = [
        "10.0.3.0/24",
        "10.0.4.0/24"
    ]
}

variable "vpc_private_db_subnets" {
    description = "Private Subnets DB"
    type = list(string) 
    default = [
        "10.0.5.0/24",
        "10.0.6.0/24"
    ]
}

variable "ec2_ami_web" {
    description = "ec2 ami id for web instances"
    type = string
    default = "ami-08f35ff5d5c07e955"
}

variable "ec2_type_web" {
    description = "ec2 instance type for web instances"
    type = string 
    default = "t2.micro"
}

variable "key_pair" {
    description = "ec2 key pair"
    type = string
    default = "InnfisKey"
}

variable "port_http" {
  description = "port number for web(http) instances"
  type = number 
  default = 80
}

variable "port_was" {
  description = "port number for was instances" 
  type = number 
  default = 3000
}

variable "vpc_tags" {
    description = "VPC tags"
    type = map(string)
    default = {
        Terraform = "true"
        Environment = "dev"
    }
}

variable "bastion_key_pair" {
    description = "ec2 key pair for bastion instances"
    type = string
    default = "InnfisKey"
}

variable "bastion_cidr_blocks" {
    description = "cidr blocks for bastion instances"
    type = list
    default = ["124.5.226.230/32"]
}

# Terraform configuration

provider "aws" {
    version = "~> 2.0"
    region = "ap-northeast-2"
}

module "vpc" {
    source = "./modules/vpc"

    azs = var.vpc_azs
    name = var.vpc_name
    cidr = var.vpc_cidr
    subnet_public = var.vpc_public_subnets
    subnet_private = var.vpc_private_subnets
    subnet_private_db = var.vpc_private_db_subnets
    ec2_ami_web = var.ec2_ami_web
    ec2_type_web = var.ec2_type_web
    key_pair = var.key_pair
    port_http = var.port_http
    port_was = var.port_was

    tags = var.vpc_tags
}

module "bastion" {
    source = "./modules/bastion"

    vpc_id = module.vpc.vpc_id
    vpc_sg_id_public = module.vpc.sg_id_public
    vpc_sg_id_private = module.vpc.sg_id_private 
    bastion_cidr_blocks = var.bastion_cidr_blocks
    bastion_ssh_port = 22
    bastion_subnet_id = module.vpc.subnet_id_public[0]
    bastion_key_pair = var.bastion_key_pair

    tags = var.vpc_tags
}
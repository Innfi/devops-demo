provider "aws" {
    version = "~> 2.0"
    region = "ap-northeast-2"
    shared_credentials_file = "~/.aws/credentials"
    profile = "InnfisDev"
}

variable "key_pair" {
    default = "InnfisKey"
}
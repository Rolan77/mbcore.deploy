terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"

}
# Define AWS as our provider
provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "bastion" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.mbcorenode.id]
  key_name = "aws_vpn"
  tags = {
    Name = "mbcore Big Server with monitoring"
  }
}
### The Elastic IP for the Bastion
/*resource "aws_eip" "eip-bastion" {
 vpc = true
 instance = aws_instance.bastion.id
 associate_with_private_ip = aws_instance.bastion.private_ip

 tags = {
  Name = "bastion"
  Projet = var.projet
  Application = var.Application
 }
}*/

provider "aws" {
    region = var.region
    #access_key = "**********"
    #secret_key = "***************"
}
#terraform-mbucket
terraform {
  backend "s3" {
    bucket = "terraform-mbucket"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "terraform-lock"
    encrypt  = true
  }
}
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance
  count = var.instance_num

  tags = {
    Name = "Hello-${count.index}"
  }
}


resource "aws_instance" "web1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance1
  count = var.instance1_num

  tags = {
    Name = "Hello1-${count.index}"
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "eu-central-1"
}

# Start an Amazon Linux VM
resource "aws_instance" "ec2-instance-example" {
  ami           = "ami-02f9ea74050d6f812"
  instance_type = "t2.micro"

  tags = {
    Name = "ec2-instance-example"
  }
}



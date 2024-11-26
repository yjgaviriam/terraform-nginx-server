provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "nginx-server" {
  ami           = "ami-0ea3c35c5c3284d82"
  instance_type = "t2.micro"
  user_data     = <<-EOF
                #!/bin/bash
                sudo yum install -y nginx
                sudo systemctl enable nginx
                sudo systemctl start nginx
                EOF
}

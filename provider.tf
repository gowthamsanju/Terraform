provider "aws" {
  region     = "ap-southeast-1"
  access_key = "AKIAUIB673RK6DWOTQRT"
}
resource "aws_security_group" "web_access" {
  name        = "singaporesg"
  description = "allow ssh and http"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}
#security group end here


resource "aws_instance" "web-server" {
  ami             = "ami-05caa5aa0186b660f"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.web_access.name}"]
  tags = {
    Name     = "test-server"
    Stage    = "testing"
    Location = "INDIA"
  }

}
      

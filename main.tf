# main.tf
provider "aws" {
  region = "ap-south-1"
}
resource "aws_security_group" "my_sg" {
  name        = "allow_http_3000"
  description = "Allow HTTP and port 3000 and SSH access"

  // Rule for port 3000
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Rule for SSH (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Outbound traffic allowed to anywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_tf_instance" {
  ami           = "ami-02521d90e7410d9f0"
  instance_type = "t2.micro"
  user_data     = file("deploy.sh")
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  tags = {
    Name = "MyTFInstance"
  }
}


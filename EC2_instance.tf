provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
}

resource "aws_security_group" "allow_ssh" {
  name_prefix = "allow-ssh-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }
}

resource "aws_instance" "example_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  
  instance_type = "t2.micro"  
  key_name      = "your_key_pair_name" 

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "Sample EC2 Instance"
  }
}


resource "aws_instance" "terraform-demo" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_terraform.id]
# label,info ,label etc.,
  tags = {
    Name = "terraform-demo-1"
    project = "roboshop-terraform"
    Environment = "dev"
  }
}

# it will take deafault vpc
resource "aws_security_group" "allow_terraform" {
  name        = "allow_terraform"
  description = "Allow  inbound traffic and outbound traffic"
  # outbound traffic
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_terraform demo-1"
  }
}

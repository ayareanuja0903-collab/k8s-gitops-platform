resource "aws_security_group" "ec2_sg" {

  name        = "devops-ec2-sg"
  description = "Allow SSH"

  vpc_id = module.vpc.vpc_id

  ingress {
    description = "SSH"

    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "devops-ec2-sg"
  }
}

resource "aws_instance" "my_ec2" {

  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t2.micro"

  subnet_id = module.vpc.public_subnets[0]

  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  key_name = "devops-key"

  associate_public_ip_address = true

  tags = {
    Name = "devops-ec2"
  }
}
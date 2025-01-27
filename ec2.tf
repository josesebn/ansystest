resource "aws_security_group" "ansysec2_sg" {
  vpc_id = aws_vpc.ansystest_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
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

resource "local_file" "ssh_key" {
  filename = "generated_key.pub"
  content  = tls_private_key.ssh_key.public_key_openssh
}

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "ansys_key_pair" {
  key_name   = "ansys-key-pair"
  public_key = local_file.ssh_key.content
}

resource "aws_instance" "ansysec2" {
  ami           = "ami-0ac4dfaf1c5c0cce9"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet_1.id
  security_groups = [aws_security_group.ansysec2_sg.name]
  key_name = aws_key_pair.ansys_key_pair.key_name
}


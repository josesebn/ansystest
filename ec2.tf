resource "aws_security_group" "ansyssg" {
  vpc_id = aws_vpc.ansystest_vpc.id
  depends_on = [aws_vpc.ansystest_vpc]
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
  tags = {
    Name = "ansystest_sg"
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
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet_1.id
  security_groups = [aws_security_group.ansyssg.id]
  key_name = aws_key_pair.ansys_key_pair.key_name
  depends_on  = [aws_security_group.ansyssg]
  tags = {
    Name = "ansystest_ec2_nginxserver"
}    
}


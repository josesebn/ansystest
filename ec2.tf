resource "aws_instance" "ansysec2" {
  ami           = "ami-0ac4dfaf1c5c0cce9"  #Amazon Linux
  instance_type = "t2.micro"
  }


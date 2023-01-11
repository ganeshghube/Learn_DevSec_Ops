resource "aws_instance" "web" {
  ami           = "ami-0b0ea68c435eb488d"
  instance_type = "t2.micro"
  tags = {
    Name = "first-tf-instance"
  }
}
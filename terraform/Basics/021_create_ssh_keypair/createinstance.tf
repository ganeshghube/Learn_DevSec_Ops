resource "aws_key_pair" "sshkeys" {
  key_name   = "deployer-key"
  public_key = file("${path.module}/sshkeys.txt")
}



resource "aws_instance" "web" {
  ami           = "ami-0b0ea68c435eb488d"
  instance_type = "t2.micro"
  key_name = aws_key_pair.sshkeys.key_name
  tags = {
    Name = "first-tf-instance"
  }
}

output "keyname" {
  value = aws_key_pair.sshkeys.key_name
}

output "ip" {
  value = aws_instance.web.public_ip
}

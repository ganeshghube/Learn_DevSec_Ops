resource "aws_key_pair" "sshkeys" {
  key_name   = "deployer-key"
  public_key = file("${path.module}/sshkeys.txt")
}

output "keyname" {
  value = aws_key_pair.sshkeys.id
}
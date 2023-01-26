variable instance_type  {
  type = string
}

variable image_name  {
  type = list
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = "${var.image_name}"
    #values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


# creating instance.
resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "${var.instance_type}"
  #key_name               = aws_key_pair.key-tf.key_name
  #vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "first-tf-instance"
  }
  user_data = file("${path.module}/script.sh")
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip
  }
  # file, local-exec, remote-exec
  provisioner "file" {
    source      = "readme.md"      # terraform machine
    destination = "/tmp/readme.md" # remote machine
  }
  provisioner "file" {
    content     = "this is test content" # terraform machine
    destination = "/tmp/content.md"      # remote machine
  }
  provisioner "local-exec" {
    command = "env>env.txt"
    environment = {
      envname = "envvalue"
    }
  }
  provisioner "local-exec" {
    command = "echo 'at Create'"
  }
  provisioner "local-exec" {
    when    = destroy
    command = "echo 'at delete'"
  }
  provisioner "remote-exec" {
    inline = [
      "ifconfig > /tmp/ifconfig.output",
      "echo 'hello gaurav'>/tmp/test.txt"
    ]
  }
  provisioner "remote-exec" {
    script = "./testscript.sh"
  }
}
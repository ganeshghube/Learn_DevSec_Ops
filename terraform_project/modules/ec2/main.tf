data "aws_ami" "amazon" {
  most_recent = true
  owners = ["137112412989"] # Canonical

  filter {
    name   = "name"
    values = ["al2022-ami-2022.0.20220728.1-kernel-5*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
 }
 
  filter {
      name   = "architecture"
      values = ["x86_64"]
 }

  
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon.id
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnets_id[0]
  tags = {
    Name = "HelloWorld"
  }
}
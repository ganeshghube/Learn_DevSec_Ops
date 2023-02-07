  module "vpc" {
  source = "./modules/vpc"

  project              = "${var.project}"
  environment          = "${var.environment}"
  region               = "${var.region}"
  availability_zones   = "${var.availability_zones}"
  vpc_cidr             = "${var.vpc_cidr}"
  public_subnets_cidr  = "${var.public_subnets_cidr}"
  private_subnets_cidr = "${var.private_subnets_cidr}"
}

module "ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"

  #instance_count = 2

  name                        = "example-normal"
  ami                         = "ami-0a0cf2b8bc4634fe1"
  instance_type               = "t2.micro"
  subnet_id                   = "${element(module.vpc.public_subnets_id, 0)}"
  #vpc_security_group_ids      = ["${module.ssh_access_sg.this_security_group_id}"]
  associate_public_ip_address = true

}

module "ec2-private" {
  source = "terraform-aws-modules/ec2-instance/aws"

  #instance_count = 2

  name                        = "example-private"
  ami                         = "ami-0a0cf2b8bc4634fe1"
  instance_type               = "t2.micro"
  subnet_id                   = "${element(module.vpc.private_subnets_id, 0)}"
  #vpc_security_group_ids      = ["${module.ssh_access_sg.this_security_group_id}"]
  associate_public_ip_address = false

}

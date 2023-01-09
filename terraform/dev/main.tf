

  module "vpc" {
  source = "../modules/vpc"

  project              = var.project
  environment          = var.environment
  region               = var.region
  availability_zones   = var.availability_zones
  vpc_cidr             = var.vpc_cidr
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
}


  module "iam" {
  source = "../modules/iam"

  user_names              = var.user_names
  environment             = var.environment
  }

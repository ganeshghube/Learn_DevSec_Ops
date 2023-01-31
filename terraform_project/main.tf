module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name
  project_env  = var.project_env
  cidr_block   = var.cidr_block
  availability_zones   = var.availability_zones
  private_cidr = var.private_cidr
  public_cidr  = var.public_cidr
  region       = var.region
}
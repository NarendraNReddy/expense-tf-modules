module "vpc" {
  source = "git::https://github.com/NarendraNReddy/terraform-aws-vpc2.git"
  #source="../terraform-aws-vpc1"
  vpc_cidr = var.vpc_cidr
  Project_name=var.Project_name
  Environment = var.environment
  common_tags = var.common_tags
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs
  is_peering_required = var.is_peering_required

}
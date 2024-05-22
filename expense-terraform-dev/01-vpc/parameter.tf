resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.Project_name}/${var.environment}/vpc_id"
  type  = "String"
  value = module.vpc.vpc_id
  overwrite = true
}
module "db" {
  source="../../terraform-aws-securitygroup"
  project_name = var.project_name
  environment = var.environment
  sg_description = "SG for DB Instance"
  vpc_id=data.aws_ssm_parameter.vpc_id.value
  common_tags = var.common_tags
  sg_name = "db"

}

module "backend" {
  source="../../terraform-aws-securitygroup"
  project_name = var.project_name
  environment = var.environment
  sg_description = "SG for Backend Instance"
  vpc_id=data.aws_ssm_parameter.vpc_id.value
  common_tags = var.common_tags
  sg_name = "backend"

}


module "frontend" {
  source="../../terraform-aws-securitygroup"
  project_name = var.project_name
  environment = var.environment
  sg_description = "SG for frontend Instances"
  vpc_id=data.aws_ssm_parameter.vpc_id.value
  common_tags = var.common_tags
  sg_name = "frontend"

}

#db is accepting connections from backend

resource "aws_security_group_rule" "db-backend" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id = module.backend.sg_id

  security_group_id = module.db.sg_id
}


resource "aws_security_group_rule" "backend-db" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = module.frontend.sg_id

  security_group_id = module.backend.sg_id
}

resource "aws_security_group_rule" "frontend-public" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  #source_security_group_id = module.frontend.sg_id
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = module.frontend.sg_id
}


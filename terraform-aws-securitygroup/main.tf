resource "aws_security_group" "allow_tls" {
  #name        = "${var.project_name}-${var.environment}-${var.sg_name}"
  name=local.sg_name_final
  #description = "Allow TLS inbound traffic and all outbound traffic"
  description = var.sg_description
  vpc_id      = var.vpc_id


#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }


dynamic "ingress"{
    for_each = var.ingress_rules
      content {
          from_port = egress.value["port"]
          to_port = egress.value["port"]
          protocol = egress.value["protocol"]
          cidr_blocks = egress.value["allow_cidr"]
        }
    }


dynamic "egress"{
    for_each = var.outbound_rules
      content {
          from_port = egress.value["port"]
          to_port = egress.value["port"]
          protocol = egress.value["protocol"]
          cidr_blocks = egress.value["allow_cidr"]
        }
    }



  tags = merge(
    var.common_tags,
    var.sg_tags,
    {
        Name=local.sg_name_final
    }
  )
}